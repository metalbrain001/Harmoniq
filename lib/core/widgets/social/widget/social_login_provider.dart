// Social login provider widget
import 'package:flutter/material.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/core/widgets/social/widget/social_logins_icon.dart';
import 'package:harmoniq/core/widgets/social/widget/social_login_helper.dart';

enum SocialLoginProvider { google, apple, github, facebook }

class SocialLoginRow extends StatelessWidget {
  SocialLoginRow({super.key});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth / 10;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialLoginsIcon(
              svgPath: 'assets/icons/google.svg',
              size: iconSize,
              color: Colors.white,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4285F4),
                  Color(0xFFDB4437),
                  Color(0xFFF4B400),
                  Color(0xFF0F9D58),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap:
                  () => handleSocialLogin(
                    context: context,
                    provider: SocialLoginHelper.google,
                    authService: _authService,
                  ),
            ),
            const SizedBox(width: 16),
            SocialLoginsIcon(
              svgPath: 'assets/icons/apple.svg',
              size: iconSize,
              color: Colors.white,
              gradient: const LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF000000)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap:
                  () => handleSocialLogin(
                    context: context,
                    provider: SocialLoginHelper.apple,
                    authService: _authService,
                  ),
            ),
            const SizedBox(width: 16),
            SocialLoginsIcon(
              svgPath: 'assets/icons/twitter.svg',
              size: iconSize,
              color: Colors.white,
              gradient: const LinearGradient(
                colors: [Color(0xFF1DA1F2), Color(0xFF14171A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap:
                  () => handleSocialLogin(
                    context: context,
                    provider: SocialLoginHelper.twitter,
                    authService: _authService,
                  ),
            ),
          ],
        );
      },
    );
  }
}
