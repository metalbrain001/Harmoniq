import 'package:flutter/material.dart';

class MiniLoader extends StatelessWidget {
  final double size;
  final Color? color;

  const MiniLoader({super.key, this.size = 20, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color!),
      ),
    );
  }
}
