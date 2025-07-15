import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/custom_feding_widget.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/sqlite.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/presentation/manage/categercubit/categer_cubit.dart';

class customgridView extends StatelessWidget {
  const customgridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategerCubit, CategerState>(
      builder: (context, state) {
        if (state is CategerLoading) {
          return SliverFillRemaining(
            child: CustomFedingWidget(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 16,
                itemBuilder:
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                    ),
              ),
            ),
          );
        } else if (state is CategerSucess) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: state.moives.length,
            itemBuilder:
                (context, index) => Stack(
                  children: [
                    GestureDetector(
                      onTap:
                          () => GoRouter.of(
                            context,
                          ).push(Gorouter.kdetails, extra: state.moives[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),

                          image: DecorationImage(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w185//${state.moives[index].imageurl}',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 10,
                      child: Row(
                        children: [
                          Text('${state.moives[index].rating}'),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                        ],
                      ),
                    ),
                    Positioned(
                      //  top: 3,
                      left: 10,
                      child: heartcustombuttom(movie: state.moives[index]),
                    ),
                  ],
                ),
          );
        } else if (state is CategerFailure) {
          return SliverToBoxAdapter(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  state.emassage.toString(),
                  style: Styles.font14.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  "There was an error ,Try again",
                  style: Styles.font14.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class heartcustombuttom extends StatefulWidget {
  const heartcustombuttom({super.key, required this.movie});
  final Moiveentity movie;
  @override
  State<heartcustombuttom> createState() => _heartcustombuttomState();
}

class _heartcustombuttomState extends State<heartcustombuttom> {
  bool isactive = false;
  bool isFavorite = false;
  Sqlitemothed sql = Sqlitemothed();
  Future<void> _toggleFavorite() async {
    // First update the UI state immediately
    setState(() {
      isactive = !isactive;
    });

    try {
      if (isactive) {
        // Use parameterized queries for safety
        int response = await sql.insertData('''
 INSERT INTO movies (
      idmoive, 
      name, 
      imageurl, 
      subtitle, 
      rating, 
      timestart
    ) VALUES (
      ${widget.movie.idmoive},
      '${widget.movie.name.replaceAll("'", "''")}',
      '${widget.movie.imageurl.replaceAll("'", "''")}',
      '${widget.movie.subtitle.replaceAll("'", "''")}',
      ${widget.movie.rating},
      '${widget.movie.timestart.replaceAll("'", "''")}'
    )
''');
        print(response.toString());
        print('Insert response: $response');
      } else {
        final response = await sql.deleteData(
          "DELETE FROM movies WHERE id = ${widget.movie.idmoive}",
        );
        print('Delete response: $response');
      }
    } catch (e) {
      // Revert UI state if operation fails
      setState(() {
        isactive = !isactive;
      });
      print('Error: $e');
    }
  }

  Future<void> toggleFavorite() async {
    try {
      final dbHelper = Sqlitemothed();

      if (!isFavorite) {
        // Remove from favorites
        await dbHelper.saveMovie(widget.movie);
        print('insert-----------${widget.movie}');
      } else {
        // Add to favorites (will update if already exists)

        await dbHelper.deleteMovie(widget.movie.idmoive);
        print('delete-----------');
      }

      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleFavorite,
      //         setState(() {
      //     isactive = !isactive;
      //   });
      //     if (isactive) {
      //       // Use parameterized queries for safety
      //       int response = await sql.insertData('''
      //  INSERT INTO movies (
      //       idmoive,
      //       name,
      //       imageurl,
      //       subtitle,
      //       rating,
      //       timestart
      //     ) VALUES (
      //       ${widget.movie.idmoive},
      //       '${widget.movie.name.replaceAll("'", "''")}',
      //       '${widget.movie.imageurl.replaceAll("'", "''")}',
      //       '${widget.movie.subtitle.replaceAll("'", "''")}',
      //       ${widget.movie.rating},
      //       '${widget.movie.timestart.replaceAll("'", "''")}'
      //     )
      // ''');
      //             print(response.toString());
      //       print('Insert response: $response');
      //     }
      //         //_toggleFavorite  // () {
      // //         setState(() async {
      // //           isactive = !isactive;
      // //           if (isactive) {
      // //             int response = await sql.insertData('''
      // //  INSERT INTO movies (
      // //       idmoive,
      // //       name,
      // //       imageurl,
      // //       subtitle,
      // //       rating,
      // //       timestart
      // //     ) VALUES (
      // //       ${widget.movie.idmoive},
      // //       '${widget.movie.name.replaceAll("'", "''")}',
      // //       '${widget.movie.imageurl.replaceAll("'", "''")}',
      // //       '${widget.movie.subtitle.replaceAll("'", "''")}',
      // //       ${widget.movie.rating},
      // //       '${widget.movie.timestart.replaceAll("'", "''")}'
      // //     )
      // // ''');
      // //             print(response.toString());
      // //           } else {
      // //             int response = await sql.deleteData(
      // //               "DELETE FROM movies WHERE id = ${widget.movie.idmoive}",
      // //             );
      // //             print(response.toString());
      // //           }
      // //         });
      //       },
      icon:
          isFavorite
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_border),
    );
  }
}
