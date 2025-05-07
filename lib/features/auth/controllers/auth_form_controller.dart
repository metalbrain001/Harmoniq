// lib/features/auth/controllers/auth_form_controller.dart

import 'package:flutter/material.dart';

class AuthFormController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  bool validate() => formKey.currentState?.validate() ?? false;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
