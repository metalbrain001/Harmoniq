import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/log_service.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/core/models/auth_user_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SocialLoginHelper { google, apple, github, twitter }

Future<void> handleSocialLogin({
  required BuildContext context,
  required SocialLoginHelper provider,
  required AuthService authService,
}) async {
  final bool isEmulator = FirebaseAuth.instance.app.options.apiKey.contains(
    "fake",
  );

  try {
    AuthUserModel? user;

    switch (provider) {
      case SocialLoginHelper.google:
        user =
            isEmulator
                ? await authService.loginWithEmail(
                  'google@mock.dev',
                  'password123',
                )
                : await authService.signInWithGoogle();
        break;
      case SocialLoginHelper.apple:
        user = await authService.signInWithApple(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        break;
      case SocialLoginHelper.github:
        user = await authService.loginWithEmail(
          'metalbrain001@hotmail.com',
          'London1983@@%%&&!!',
        );
        break;
      case SocialLoginHelper.twitter:
        user = await authService.signInWithTwitter();
        break;
    }

    if (user != null) {
      LogService.d('✅ ${provider.name} login: ${user.email}');
      if (context.mounted) context.go('/home');
    } else {
      LogService.e('❌ ${provider.name} login failed or cancelled.');
    }
  } catch (e) {
    LogService.e('⚠️ ${provider.name} login error: $e');
  }
}
