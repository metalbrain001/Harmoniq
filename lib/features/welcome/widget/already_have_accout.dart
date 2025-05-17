import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/helper/enum/app_enum.dart';
import 'package:with_opacity/with_opacity.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: 'SFCompact',
            fontWeight: FontWeight.w400,
            color: AppColors.onboardingText.withCustomOpacity(0.8),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => context.goNamed(AppRoute.login.name),
          child: Text(
            'Sign in',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'SFCompact',
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
