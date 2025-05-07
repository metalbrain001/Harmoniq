import 'package:flutter/material.dart';
import 'package:harmoniq/core/widgets/logo_widget.dart';

class HarmoniqHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleColor;
  final logoSize = 100.0;

  const HarmoniqHeader({
    super.key,
    this.title = 'Harmoniq',
    this.subtitle = 'Designed to connect people',
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ✅ Logo widget
        // This widget is rotated 180 degrees to match the design
        Transform.rotate(
          angle: 3.1416, // Rotate 180 degrees in radians
          child: LogoWidget(),
        ),
        // Margin between logo and text
        const SizedBox(height: 16),
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurfaceVariant.withValues(),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant.withValues(),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
