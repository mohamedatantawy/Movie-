import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/feature/Home/presentation/manage/categercubit/categer_cubit.dart';

class CustomElevatedbutton extends StatefulWidget {
  const CustomElevatedbutton({
    super.key,
    required this.title,
    required this.num,
  });
  final String title;
  final int num;
  @override
  State<CustomElevatedbutton> createState() => _CustomElevatedbuttonState();
}

class _CustomElevatedbuttonState extends State<CustomElevatedbutton> {
  @override
  void initState() {
    BlocProvider.of<CategerCubit>(context).getcateger(widget.num);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            BlocProvider.of<CategerCubit>(context).getcateger(widget.num);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(widget.title),
      ),
    );
  }
}
