import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/terms_and_condition.dart';
import 'package:harmoniq/features/welcome/widget/already_have_accout.dart';
import 'package:harmoniq/features/welcome/widget/welcome_widget.dart';
import 'package:harmoniq/core/widgets/button/common_btn.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/core/constants/button_enum.dart';
import 'package:harmoniq/core/widgets/social/widget/social_toggle.dart';

/// A screen that welcomes users to the app and provides options for account creation and social login.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSocialLogin = false;
  bool isChecked = false;
  bool showError = false;

  void toggleSocialLogin() {
    setState(() => showSocialLogin = !showSocialLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeWidget(
        title: 'Global Connection',
        description: 'Find like-minded people across cultures and continents.',
        imageAsset: 'assets/images/voltsnow.png',
        buttonText: 'Get Started',
        onNext: () {
          context.go('/register');
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Optional top spacing
              Text(
                'Harmoniq',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: 'SFCompact', // Use the registered family name
                  fontWeight: FontWeight.w700, // Use correct weight
                  fontStyle: FontStyle.normal, // Use italic style
                  color: AppColors.onboardingText,
                ),
              ),
              // Join the community
              const SizedBox(height: 8),
              Text(
                'Join the community',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'SFCompact',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: AppColors.onboardingText,
                ),
              ),
              const SizedBox(height: 24),
              SocialLoginToggleView(
                showSocialLogins: showSocialLogin,
                onToggle: toggleSocialLogin,
              ),
              const SizedBox(height: 16),
              Text(
                'Or',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'SFCompact',
                  fontWeight: FontWeight.w400,
                  color: AppColors.onboardingText,
                ),
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'Create Account',
                onPressed: () {
                  context.go('/register');
                },
                type: ButtonType.primary,
                size: ButtonSize.xsmall,
                backgroundColor: AppColors.buttonBackground,
                foregroundColor: AppColors.buttonText,
              ),
              const SizedBox(height: 16),
              const AlreadyHaveAccount(),
              const SizedBox(height: 80),
              TermsAndCondition(
                showCheckbox: true,
                isChecked: isChecked,
                isError: showError,
                onChanged: (val) {
                  setState(() {
                    isChecked = val ?? false;
                    showError = false;
                  });
                },
                onTermsTap: () => context.push('/terms'),
                onPrivacyTap: () => context.push('/privacy'),
                onDataUsageTap: () => context.push('/data-policy'),
              ),
              // Terms and conditions
            ],
          ),
        ),
      ),
    );
  }
}
