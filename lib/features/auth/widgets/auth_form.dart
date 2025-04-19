// lib/features/auth/widgets/auth_form.dart

import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const AuthForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: "Enter your email",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: "Enter your password",
            ),
          ),
        ),
      ],
    );
  }
}
