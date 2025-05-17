// Created by: Harmoniq Team
import 'package:flutter/material.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/core/widgets/social/widget/social_login_button.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/core/widgets/social/widget/social_login_helper.dart';
import 'package:with_opacity/with_opacity.dart';

class SocialLoginToggleView extends StatefulWidget {
  final bool showSocialLogins;
  final VoidCallback onToggle;

  const SocialLoginToggleView({
    super.key,
    this.showSocialLogins = false,
    required this.onToggle,
  });

  @override
  State<SocialLoginToggleView> createState() => _SocialLoginToggleViewState();
}

class _SocialLoginToggleViewState extends State<SocialLoginToggleView> {
  bool _showSocialLogins = false;
  final AuthService _authService = AuthService();

  void _toggleSocialLogins() {
    setState(() => _showSocialLogins = !_showSocialLogins);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleSocialLogins,
          child: Text(
            _showSocialLogins ? 'Hide sign-in options' : 'Sign up with',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'SFCompact',
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: AppColors.onboardingText.withCustomOpacity(0.9),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (_showSocialLogins) ...[
          SocialLoginButton(
            provider: SocialProvider.google,
            onPressed:
                () => handleSocialLogin(
                  context: context,
                  provider: SocialLoginHelper.google,
                  authService: _authService,
                ),
          ),
          const SizedBox(height: 12),
          SocialLoginButton(
            provider: SocialProvider.apple,
            onPressed:
                () => handleSocialLogin(
                  context: context,
                  provider: SocialLoginHelper.apple,
                  authService: _authService,
                ),
          ),
          const SizedBox(height: 12),
          SocialLoginButton(
            provider: SocialProvider.twitter,
            onPressed:
                () => handleSocialLogin(
                  context: context,
                  provider: SocialLoginHelper.twitter,
                  authService: _authService,
                ),
          ),
        ],
      ],
    );
  }
}
