import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/custom_feding_widget.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/styles.dart';
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
                itemCount: 10,
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
                (context, index) => GestureDetector(
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
