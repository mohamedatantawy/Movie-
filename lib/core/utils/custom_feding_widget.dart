import 'package:flutter/material.dart';

class CustomFedingWidget extends StatefulWidget {
  const CustomFedingWidget({super.key, required this.child});
  final Widget child;
  @override
  State<CustomFedingWidget> createState() => _CustomFedingWidgetState();
}

class _CustomFedingWidgetState extends State<CustomFedingWidget>
    with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    animation = Tween<dynamic>(
      begin: .2,
      end: 0.8,
    ).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: animation.value, child: widget.child);
  }
}
