// Harmoniq onboarding widget
// lib/features/onboarding/widgets/harmoniq_onboard.dart
import 'package:flutter/material.dart';
import 'package:harmoniq/core/constants/button_enum.dart';
import 'package:harmoniq/core/widgets/button/common_btn.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:with_opacity/with_opacity.dart';

class HarmoniqOnboardPage {
  final String title;
  final String description;
  final String imageAsset;
  final String buttonText;

  const HarmoniqOnboardPage({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.buttonText,
  });
}

class HarmoniqOnboard extends StatelessWidget {
  final HarmoniqOnboardPage page;
  final VoidCallback onNext;

  const HarmoniqOnboard({super.key, required this.page, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(page.imageAsset, height: 160),
          const SizedBox(height: 32),
          Text(
            page.title,
            key: const Key('onboarding_title'),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.onboardingText,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          Text(
            page.description,
            key: const Key('onboarding_description'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onboardingText.withCustomOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // Image placeholder for the button
          Image.asset(page.imageAsset, height: 160),
          const SizedBox(height: 24),
          AppButton(
            text: page.buttonText,
            onPressed: onNext,
            type: ButtonType.primary,
            size: ButtonSize.medium,
            backgroundColor: AppColors.buttonBackground,
            foregroundColor: AppColors.buttonText,
          ),
        ],
      ),
    );
  }
}
