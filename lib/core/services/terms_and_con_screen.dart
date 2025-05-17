import 'package:flutter/material.dart';
import 'package:harmoniq/core/services/terms_and_condition.dart';
import 'package:harmoniq/core/theme/app_colors.dart';

class TermsAndConScreen extends StatelessWidget {
  const TermsAndConScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: AppColors.appBarBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TermsAndCondition(
          showCheckbox: false, // no checkbox here
          isChecked: false,
          isError: false,
          onChanged: (_) {}, // not used
          onTermsTap: () {
            // Already on this screen, optionally show a snackbar or scroll
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("You're already viewing Terms & Conditions."),
              ),
            );
          },
          onPrivacyTap: () {
            Navigator.of(context).pushNamed('/privacy');
          },
          onDataUsageTap: () {
            Navigator.of(context).pushNamed('/data-policy');
          },
        ),
      ),
    );
  }
}
