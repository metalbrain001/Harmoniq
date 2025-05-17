import 'package:flutter/material.dart';
import 'package:harmoniq/core/theme/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool?> onChanged;
  final bool isError;
  final bool isDisabled;

  const CustomCheckbox({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.isError = false,
    this.isDisabled = false,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      tristate: false,
      onChanged:
          widget.isDisabled
              ? null
              : (bool? value) {
                setState(() {
                  isChecked = value;
                });
                widget.onChanged(value);
              },
      activeColor:
          widget.isError
              ? AppColors.checkBoxError
              : AppColors.checkBoxPrimary, // use your defined theme color
      checkColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(
        color:
            widget.isError
                ? AppColors.checkBoxError
                : AppColors.checkBoxPrimary, // use your defined theme color
        width: 2,
      ),
    );
  }
}
