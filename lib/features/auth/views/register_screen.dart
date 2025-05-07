// lib/features/auth/views/register_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/features/auth/widgets/auth_form.dart';
import 'package:harmoniq/features/auth/widgets/auth_layout.dart';
import 'package:harmoniq/features/auth/controllers/auth_form_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final AuthFormController _form;

  @override
  void initState() {
    super.initState();
    _form = AuthFormController();
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_form.validate()) return;

    final email = _form.email;
    final password = _form.password;
    final authService = AuthService();

    try {
      final user = await authService.registerWithEmail(email, password);
      if (!mounted) return;

      if (user != null) {
        context.goNamed('home');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Registration failed')));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: SafeArea(
        child: LayoutBuilder(
          builder:
              (context, constraints) => SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Create an account',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    AuthForm(
                      formKey: _form.formKey,
                      emailController: _form.emailController,
                      passwordController: _form.passwordController,
                      isRegister: true,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _handleRegister,
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        context.goNamed('login');
                      },
                      child: const Text('Already have an account? Log in'),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
