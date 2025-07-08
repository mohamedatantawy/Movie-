import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/getit_server.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Search/data/Repos/searchRepos.dart';
import 'package:movie/feature/Search/presentation/manger/search/sreach_cubit.dart';
import 'package:movie/feature/Search/presentation/view/widget/Customappbar.dart'
    show Customappbar;
import 'package:movie/feature/Search/presentation/view/widget/customTextfield.dart';

class Searchview extends StatefulWidget {
  const Searchview({super.key});

  @override
  State<Searchview> createState() => _SearchviewState();
}

class _SearchviewState extends State<Searchview> {
  TextEditingController _search = TextEditingController();
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<searchReposImple>()),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              Customappbar(),
              SizedBox(height: 20),
              Customtextfield(),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is SearchSucess) {
                    //return Container(height: 50, color: Colors.redAccent);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.moive.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap:
                                () => GoRouter.of(context).push(
                                  Gorouter.kdetails,
                                  extra: state.moive[index],
                                ),
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration:
                                  (state.moive[index].imageurl).isNotEmpty
                                      ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            (state.moive[index].imageurl)
                                                    .isEmpty
                                                ? "https://image.tmdb.org/t/p/w185//6ybVIbpAnI5oJespruRqdow5XsK.jpg"
                                                : "https://image.tmdb.org/t/p/w185//${state.moive[index].imageurl}",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                      : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey,
                                      ),
                            ),
                            subtitle: Text(
                              state.moive[index].subtitle,
                              style: Styles.font14.copyWith(
                                color: Colors.blueGrey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            title: Text(
                              state.moive[index].name,
                              style: Styles.font20,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(color: Colors.blue);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
