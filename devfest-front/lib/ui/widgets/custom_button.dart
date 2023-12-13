import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final double width;
  final void Function() onTap;
  const MyButton(
      {super.key,
      required this.child,
      required this.color,
      required this.radius, required this.onTap ,required this.width });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
            vertical: ScreenInfo.height * 0.01),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

