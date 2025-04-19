import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmoniq/core/services/theme_provider.dart';

class AuthLayout extends ConsumerWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar:
          user != null
              ? AppBar(
                title: const Text('Harmoniq'),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                actions: [
                  IconButton(
                    icon: Icon(
                      themeMode == ThemeMode.dark
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    tooltip: 'Toggle Theme',
                    onPressed: () {
                      final isDark = themeMode == ThemeMode.dark;
                      ref.read(themeModeProvider.notifier).state =
                          isDark ? ThemeMode.light : ThemeMode.dark;
                    },
                  ),
                ],
              )
              : null,
      body: child,
    );
  }
}
