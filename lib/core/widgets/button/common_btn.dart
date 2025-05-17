// Custom button widget for the app
// This widget is designed to be reusable and customizable
import 'package:flutter/material.dart';
import 'package:with_opacity/with_opacity.dart';
import 'package:harmoniq/core/constants/button_enum.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/core/widgets/mini_loader.dart';

enum Provider { google, apple, facebook }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final bool loading;
  final ButtonType type;
  final ButtonSize size;
  final Widget? icon;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  // Support for Gradient background color
  final Gradient? gradient;
  final BoxDecoration? gradientBackground;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.loading = false,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.backgroundColor,
    this.foregroundColor,
    this.gradient,
    this.gradientBackground,
  });

  double getHeight() {
    return switch (size) {
      ButtonSize.xsmall => 32,
      ButtonSize.small => 40,
      ButtonSize.medium => 48,
      ButtonSize.large => 56,
      ButtonSize.xlarge => 64,
    };
  }

  TextStyle getTextStyle() {
    return switch (size) {
      ButtonSize.xsmall => const TextStyle(fontSize: 12),
      ButtonSize.small => const TextStyle(fontSize: 14),
      ButtonSize.medium => const TextStyle(fontSize: 16),
      ButtonSize.large => const TextStyle(fontSize: 18),
      ButtonSize.xlarge => const TextStyle(fontSize: 20),
    };
  }

  Color getBackgroundColor(ColorScheme colorScheme) {
    return switch (type) {
      ButtonType.primary => backgroundColor ?? AppColors.buttonBackground,
      ButtonType.secondary => backgroundColor ?? colorScheme.secondary,
      ButtonType.outline => backgroundColor ?? Colors.transparent,
      ButtonType.danger => backgroundColor ?? Colors.red,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = getHeight();
    final textStyle = getTextStyle();
    final bgColor = getBackgroundColor(colorScheme);
    final fgColor =
        foregroundColor ??
        (type == ButtonType.outline
            ? colorScheme.primary
            : type == ButtonType.danger
            ? Colors.white
            : colorScheme.onPrimary);

    final BorderRadius borderRadius = BorderRadius.circular(8);
    final BorderSide? side =
        type == ButtonType.outline
            ? BorderSide(color: colorScheme.primary, width: 1.8)
            : null;

    final ButtonStyle style = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.disabled)
            ? bgColor.withCustomOpacity(0.12)
            : bgColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.disabled)
            ? fgColor.withCustomOpacity(0.38)
            : fgColor;
      }),
      padding: WidgetStateProperty.all(padding),
      minimumSize: WidgetStateProperty.all(Size.fromHeight(height)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: side ?? BorderSide.none,
        ),
      ),
      textStyle: WidgetStateProperty.all(textStyle),
    );

    final content =
        loading
            ? const MiniLoader()
            : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, const SizedBox(width: 8)],
                Flexible(child: Text(text, overflow: TextOverflow.ellipsis)),
              ],
            );

    final VoidCallback? action = enabled && !loading ? onPressed : null;

    final button = switch (type) {
      ButtonType.outline => OutlinedButton(
        onPressed: action,
        style: style,
        child: content,
      ),
      ButtonType.primary || ButtonType.secondary || ButtonType.danger =>
        ElevatedButton(onPressed: action, style: style, child: content),
    };
    return gradient != null
        ? Container(
          decoration: gradientBackground,
          child: ClipRRect(borderRadius: borderRadius, child: button),
        )
        : button;
  }
}
