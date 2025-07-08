import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Details/presentation/manges/similarcubit/similar_cubit.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

class Detailviewbody extends StatelessWidget {
  const Detailviewbody({super.key, required this.moiveentity});
  final Moiveentity moiveentity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),

                      image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w185//${moiveentity.imageurl}',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  child: Text("Name ", style: Styles.font20),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(moiveentity.name, style: Styles.font16),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  child: Text("OverView", style: Styles.font20),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(moiveentity.subtitle, style: Styles.font16),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  child: Text("Date", style: Styles.font20),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(moiveentity.timestart, style: Styles.font16),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  child: Text("rating", style: Styles.font20),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    moiveentity.rating.toString(),
                    style: Styles.font16,
                  ),
                ),
                Text("Similar Moives", style: Styles.font20),
              ],
            ),
          ),
          BlocBuilder<SimilarCubit, SimilarState>(
            builder: (context, state) {
              if (state is SimilarSucess) {
                return SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,

                    crossAxisSpacing: 10,
                  ),
                  itemCount: state.movie.length,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap:
                            () => GoRouter.of(context).push(
                              Gorouter.kdetails,
                              extra: state.movie[index],
                            ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w185//${state.movie[index].imageurl}',
                                //   ${moives[index].imageurl}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                );
              } else if (state is SimilarLaoding) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Container(height: 100, color: Colors.amber),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
