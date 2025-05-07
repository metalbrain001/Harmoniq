// lib/features/auth/widgets/auth_form.dart

import 'package:flutter/material.dart';
import 'package:harmoniq/features/auth/widgets/auth_form_field.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isRegister;

  const AuthForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.isRegister = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailFormField(controller: emailController),
          const SizedBox(height: 16),
          PasswordFormField(controller: passwordController),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
