// This widget is part of the Flutter application and is used to display a group of button types.
import 'package:flutter/material.dart';

class ButtonTypesGroup extends StatelessWidget {
  final bool enabled;
  final String? label;
  final VoidCallback? onPressed;

  const ButtonTypesGroup({
    super.key,
    required this.enabled,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final VoidCallback? action = enabled ? onPressed ?? () {} : null;

    return Column(
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(label!, style: Theme.of(context).textTheme.titleMedium),
          ),
        ElevatedButton(onPressed: action, child: const Text('Elevated')),
        FilledButton(onPressed: action, child: const Text('Filled')),
        FilledButton.tonal(
          onPressed: action,
          child: const Text('Filled Tonal'),
        ),
        OutlinedButton(onPressed: action, child: const Text('Outlined')),
        TextButton(onPressed: action, child: const Text('Text')),
      ],
    );
  }
}
