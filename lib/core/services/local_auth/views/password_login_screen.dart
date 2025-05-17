import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordLoginScreen extends StatelessWidget {
  const PasswordLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Render welcome message, input field, and password login button.
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome back, MetalBrain'),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
              onSubmitted: (password) async {
                try {
                  final email = FirebaseAuth.instance.currentUser?.email;
                  if (email != null) {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    // Navigate to home screen
                    if (context.mounted) {
                      context.goNamed('home');
                    }
                  }
                } catch (e) {
                  // show error
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
