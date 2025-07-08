import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/assets.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/feature/Home/presentation/Views/widget/Customecategers.dart';
import 'package:movie/feature/Home/presentation/Views/widget/customGridview.dart';
import 'package:movie/feature/Home/presentation/Views/widget/showbestmoive.dart';
import 'package:movie/feature/Home/presentation/manage/bestmoivecubit/bestmoivecubit_cubit.dart';
import 'package:movie/feature/Home/presentation/manage/categercubit/categer_cubit.dart';

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key});

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  int _refreshCounter = 0;

  Future<void> _refreshData() async {
    setState(() {
      _refreshCounter++;
    });

    // Add your data fetching logic here
    context.read<CategerCubit>().getcateger(0);
    context.read<BestmoivecubitCubit>().getmoives();
    await Future.delayed(Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverToBoxAdapter(child: Showbestmoive()),

            SliverToBoxAdapter(child: Customcategers()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            customgridView(),
          ],
        ),
      ),
    );
  }
}
