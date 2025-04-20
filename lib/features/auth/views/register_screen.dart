// This code is part of the Harmoniq app, which is a Flutter application.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/widgets/register_button.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/features/auth/widgets/auth_form.dart';
import 'package:harmoniq/features/auth/controllers/auth_form_controller.dart';
import 'package:harmoniq/features/auth/widgets/auth_layout.dart';

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
    final email = _form.email;
    final password = _form.password;
    final authService = AuthService();

    try {
      final user = await authService.registerWithEmail(email, password);
      if (!mounted) return;

      if (user != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Welcome, ${user.email}!')));
        context.goNamed('home');
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
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AuthForm(
                        emailController: _form.emailController,
                        passwordController: _form.passwordController,
                      ),
                      const SizedBox(height: 20),
                      RegisterButton(onPressed: _handleRegister),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => context.goNamed('login'),
                        child: const Text('Already have an account? Login'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
