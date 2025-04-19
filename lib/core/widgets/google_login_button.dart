import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: "Continue with Google",
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () async {
        try {
          final user = await AuthService().signInWithGoogle();
          if (user != null && context.mounted) {
            context.goNamed('home');
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error signing in with Google: $e'),
                duration: const Duration(seconds: 10),
              ),
            );
          }
        }
      },
    );
  }
}
