import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final String buttonText;
  final VoidCallback onNext;
  final Widget child;

  const WelcomeWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.buttonText,
    required this.onNext,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with blur
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            key: const Key('welcome_background_image'),
          ),
        ),
        // Foreground content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: child,
          ),
        ),
      ],
    );
  }
}
