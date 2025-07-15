import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/sqlite.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Home/data/models/moivemodels.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SettingBody()));
  }
}

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  List<Moiveentity> _movies = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final movies = await Sqlitemothed().getAllMovies();
      setState(() {
        _movies = movies;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load movies: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(child: Text(_errorMessage));
    }

    if (_movies.isEmpty) {
      return const Center(child: Text('No movies found'));
    }

    return ListView.builder(
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        final movie = _movies[index];
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.delete, size: 35),
            color: Colors.red,
          ),
          secondaryBackground: Container(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(Icons.delete, size: 35),
                ),
              ],
            ),
            color: Colors.red,
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart ||
                direction == DismissDirection.startToEnd) {
              Sqlitemothed().deleteMovie(movie.idmoive);
            }
          },
          child: ListTile(
            onTap: () {
              GoRouter.of(
                context,
              ).push(Gorouter.kdetails, extra: _movies[index]);
            },
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:
                    movie.imageurl.isNotEmpty
                        ? DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w185${movie.imageurl}",
                          ),
                          fit: BoxFit.cover,
                        )
                        : null,
                color: Colors.grey,
              ),
            ),
            title: Text(movie.name, style: TextStyle(fontSize: 20)),
            subtitle: Text(
              movie.subtitle,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
