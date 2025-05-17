import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/widgets/button/common_btn.dart';
import 'package:harmoniq/core/constants/button_enum.dart';
import 'package:harmoniq/core/widgets/fields/common_text_field.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:with_opacity/with_opacity.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  void _onLoginPressed() async {
    setState(() => _loading = true);
    // Validate input
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _loading = false);
      return; // Show error message
    }
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1)); // Simulated delay
    setState(() => _loading = false);
    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/face-id.svg',
                width: 64,
                height: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome back, Metalbrain 👋',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onboardingText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in with your password or use Face ID.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.onboardingText.withCustomOpacity(0.7),
                ),
              ),
              const SizedBox(height: 32),
              CommonTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'metalbrain@protonmail.com',
                type: TextFieldType.email,
              ),
              const SizedBox(height: 16),
              CommonTextField(
                controller: _passwordController,
                label: 'Password',
                hint: '••••••••',
                type: TextFieldType.password,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'Sign In',
                icon: const Icon(Icons.login, size: 20),
                onPressed: _onLoginPressed,
                loading: _loading,
                type: ButtonType.primary,
                size: ButtonSize.small,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
