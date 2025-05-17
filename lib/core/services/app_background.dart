// App background service
import 'dart:ui';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const AppBackground({
    super.key,
    required this.child,
    this.imagePath = 'assets/images/voltsnow.png',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(color: Colors.transparent),
        ),
        child,
      ],
    );
  }
}
