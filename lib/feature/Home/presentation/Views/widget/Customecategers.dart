import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/Home/presentation/Views/widget/customElevatedbutton.dart';
import 'package:movie/feature/Home/presentation/manage/categercubit/categer_cubit.dart';

class Customcategers extends StatelessWidget {
  const Customcategers({super.key});


 
 final List<String> itemscateges =const [
    'Now Playing',
    'Upcoming',
    'Top Rated',
    'Popular',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemscateges.length, (index) {
        

          return CustomElevatedbutton(title: itemscateges[index],num: index,);
        }),
      ),
    );
  }
}
