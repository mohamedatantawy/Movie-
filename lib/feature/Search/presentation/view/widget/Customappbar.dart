import 'package:flutter/material.dart';
import 'package:movie/core/utils/styles.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(Icons.search, size: 35),
        Center(child: Text("SearchPage", style: Styles.font26)),
       
      ],
    );
  }
}
