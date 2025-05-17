// lib/core/widgets/social/social_login_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoniq/core/constants/button_enum.dart';
import 'package:harmoniq/core/widgets/button/common_btn.dart';

enum SocialProvider { google, apple, github, twitter }

class SocialLoginButton extends StatelessWidget {
  final SocialProvider provider;
  final VoidCallback onPressed;
  final ButtonSize size;

  const SocialLoginButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.size = ButtonSize.xsmall,
  });

  String _getLabel() {
    return switch (provider) {
      SocialProvider.google => 'Sign up with Google',
      SocialProvider.apple => 'Sign up with Apple',
      SocialProvider.github => 'Sign up with GitHub',
      SocialProvider.twitter => 'Sign up with Twitter',
    };
  }

  String _getIconPath() {
    return switch (provider) {
      SocialProvider.google => 'assets/icons/google.svg',
      SocialProvider.apple => 'assets/icons/apple.svg',
      SocialProvider.github => 'assets/icons/github.svg',
      SocialProvider.twitter => 'assets/icons/x.svg',
    };
  }

  Color _getForegroundColor() {
    return switch (provider) {
      SocialProvider.google => Colors.black,
      SocialProvider.apple => Colors.black,
      SocialProvider.github => Colors.black,
      SocialProvider.twitter => Colors.white,
    };
  }

  Color _getBackgroundColor() {
    return switch (provider) {
      SocialProvider.google => Colors.white,
      SocialProvider.apple => Colors.white,
      SocialProvider.github => Colors.white,
      SocialProvider.twitter => const Color(0xFF000000),
    };
  }

  Gradient? _getGradient() {
    return switch (provider) {
      SocialProvider.google => const LinearGradient(
        colors: [
          Color(0xFF4285F4),
          Color(0xFF34A853),
          Color(0xFFFBBC05),
          Color(0xFFEA4335),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      SocialProvider.apple => null,
      SocialProvider.github => null,
      SocialProvider.twitter => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: _getLabel(),
      onPressed: onPressed,
      type: ButtonType.outline,
      size: size,
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getForegroundColor(),
      gradient: _getGradient(),
      icon: SvgPicture.asset(
        _getIconPath(),
        width: 20,
        height: 20,
        colorFilter:
            _getGradient() != null
                ? null // Use the SVG's default color (e.g., white) for better contrast
                : ColorFilter.mode(_getForegroundColor(), BlendMode.srcIn),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
