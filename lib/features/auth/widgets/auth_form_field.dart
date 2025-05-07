import 'package:flutter/material.dart';
import 'package:harmoniq/core/widgets/fields/common_text_field.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: controller,
      label: 'Email',
      hint: 'Enter your email',
      type: TextFieldType.email,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Email is required';
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Invalid email';
        }
        return null;
      },
    );
  }
}

class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: controller,
      label: 'Password',
      hint: 'Enter your password',
      type: TextFieldType.password,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Password is required';
        if (value.length < 6) return 'Minimum 6 characters';
        return null;
      },
    );
  }
}
