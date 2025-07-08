import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Search/presentation/manger/search/sreach_cubit.dart';

class Customtextfield extends StatefulWidget {
  const Customtextfield({super.key});

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        print(value.toString());
        BlocProvider.of<SearchCubit>(context).getSeach(word: value.toString());
        print("$value 2");
      },
      //
      //controller:textEditingController ,
      decoration: InputDecoration(
        enabledBorder: outlinebord(),
        border: outlinebord(),
        focusedBorder: outlinebord(),
        //  hintText: 'Search',
        label: Text('search'),
        labelStyle: Styles.font16,
        suffixIcon: Icon(Icons.search),
      ),
    );
  }

  OutlineInputBorder outlinebord() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.blue),
    );
  }
}
