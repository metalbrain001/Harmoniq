import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.1416, // Rotate 180 degrees in radians
      child: Image.asset('assets/icons/icon.png', height: 100),
    );
  }
}
