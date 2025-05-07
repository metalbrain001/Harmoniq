// Project: flutter_app_template
// File: common_text_field.dart
import 'package:flutter/material.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/core/widgets/fields/base_text_field.dart';
import 'package:with_opacity/with_opacity.dart';

enum TextFieldType { normal, password, search, email, phone }

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextFieldType type;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.type = TextFieldType.normal,
    this.validator,
    this.onChanged,
  });

  bool get isPassword => type == TextFieldType.password;
  bool get isSearch => type == TextFieldType.search;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withCustomOpacity(0.05),
        labelStyle: const TextStyle(color: AppColors.textFieldText),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
