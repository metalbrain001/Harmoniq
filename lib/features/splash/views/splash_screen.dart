import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show splash while loading auth state
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          // User is logged in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.goNamed('home');
          });
        } else {
          // Not logged in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.goNamed('login');
          });
        }

        return const SizedBox.shrink(); // Prevent rebuild glitches
      },
    );
  }
}
