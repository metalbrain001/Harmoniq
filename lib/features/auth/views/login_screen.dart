import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/features/auth/controllers/auth_form_controller.dart';
import 'package:harmoniq/features/auth/widgets/auth_form.dart';
import 'package:harmoniq/core/widgets/google_login_button.dart';
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
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthForm(
                emailController: _form.emailController,
                passwordController: _form.passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.goNamed('register');
                },
                child: const Text('Create an account'),
              ),
              const Divider(),
              const SizedBox(height: 10),
              const GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
