// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HarmoniqLogo extends StatelessWidget {
  const HarmoniqLogo({super.key});
  final String imagePath = 'assets/images/harmon.png';
  final double height = 100;
  final double width = 100;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
