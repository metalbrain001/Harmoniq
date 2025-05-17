// // Social Login display screen
import 'package:flutter/material.dart';
import 'package:harmoniq/core/widgets/social/widget/social_toggle.dart';

class SocialLoginIconDisplay extends StatelessWidget {
  const SocialLoginIconDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SocialLoginToggleView(
          onToggle: () {
            // Handle toggle action
            // You can add your logic here if needed
          },
        ),
      ),
    );
  }
}
