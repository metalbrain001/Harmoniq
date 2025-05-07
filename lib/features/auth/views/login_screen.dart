// lib/features/auth/views/login_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/features/auth/controllers/auth_form_controller.dart';
import 'package:harmoniq/features/auth/widgets/auth_form.dart';
import 'package:harmoniq/features/auth/widgets/auth_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  Future<void> _handleLogin() async {
    if (!_form.validate()) return;

    final email = _form.email;
    final password = _form.password;
    final authService = AuthService();

    try {
      final user = await authService.loginWithEmail(email, password);
      if (!mounted) return;

      if (user != null) {
        context.goNamed('home');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
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
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 16),
                        AuthForm(
                          formKey: _form.formKey,
                          emailController: _form.emailController,
                          passwordController: _form.passwordController,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _handleLogin,
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () => context.goNamed('forgot_password'),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.goNamed('register'),
                          child: const Text(
                            'Create an account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text(
                          'Or login with',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
