// Base Text fields widget
import 'package:flutter/material.dart';
import 'package:harmoniq/core/theme/app_colors.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool enabled;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const BaseTextField({
    super.key,
    required this.controller,
    required this.decoration,
    this.textStyle,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      validator: validator,
      onChanged: onChanged,
      style: textStyle,
      cursorColor: AppColors.textFieldPrimary,
      decoration: decoration,
    );
  }
}
