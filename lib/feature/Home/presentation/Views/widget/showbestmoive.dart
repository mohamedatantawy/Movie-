import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/custom_feding_widget.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Home/presentation/manage/bestmoivecubit/bestmoivecubit_cubit.dart';

class Showbestmoive extends StatefulWidget {
  const Showbestmoive({super.key});

  @override
  State<Showbestmoive> createState() => _ShowbestmoiveState();
}

class _ShowbestmoiveState extends State<Showbestmoive> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestmoivecubitCubit, BestmoivecubitState>(
      builder: (context, state) {
        if (state is Bestmoivecubitloading) {
          return CarouselSlider(
            items: List.generate(
              5,
              (index) => CustomFedingWidget(
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    color: Colors.grey[100],
                  ),
                  // child: Image.asset(
                  //   Assets.assetsImageBr,

                  //   // 'https://image.tmdb.org/t/p/w185//6ybVIbpAnI5oJespruRqdow5XsK.jpg',
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
            ),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 1.1,
              initialPage: 0,
            ),
          );
        } else if (state is BestmoivecubitSecuess) {
          return CarouselSlider(
            items: List.generate(
              state.moives.length,
              (index) => GestureDetector(
                onTap:
                    () => GoRouter.of(
                      context,
                    ).push(Gorouter.kdetails, extra: state.moives[index]),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    image: DecorationImage(
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w185//${state.moives[index].imageurl}",
                        // 'https://image.tmdb.org/t/p/w185//6ybVIbpAnI5oJespruRqdow5XsK.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // child: Image.asset(
                  //   Assets.assetsImageBr,

                  //   // 'https://image.tmdb.org/t/p/w185//6ybVIbpAnI5oJespruRqdow5XsK.jpg',
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
            ),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 1.1,
              initialPage: 0,
            ),
          );
        } else if (state is Bestmoivecubitfailure) {
          return Container(
            width: 300,
            height: 350,
            margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                state.emassage.toString(),
                style: Styles.font16.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          );
        } else {
          return Container(
            width: 300,
            height: 350,
            margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                "there was an Error ,Try Again",
                style: Styles.font16.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          );
        }
      },
    );
  }
}
