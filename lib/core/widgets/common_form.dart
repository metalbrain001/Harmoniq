// This is a reuable form widget that can be used in different screens
import 'package:flutter/material.dart';

class CommonForm extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback? onSubmit;
  final bool isLoading;

  const CommonForm({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.onSubmit,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          child,
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: isLoading ? null : onSubmit,
            child: isLoading ? CircularProgressIndicator() : Text('Submit'),
          ),
        ],
      ),
    );
  }
}
