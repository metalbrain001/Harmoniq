import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harmoniq/core/router/app_router.dart';
import 'package:harmoniq/core/services/log_service.dart';
import 'firebase_options.dart';
import 'package:harmoniq/core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmoniq/core/services/theme_provider.dart';

// void main() async {
//   // Initialize Firebase
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   FlutterError.onError = (FlutterErrorDetails details) {
//     debugPrint("🌋 Flutter Error: ${details.exceptionAsString()}");
//   };
//   // Run the app
//   // runApp(const MyApp());
//   runApp(const ProviderScope(child: MyApp()));
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const isTestEnv = bool.fromEnvironment('FLUTTER_TEST', defaultValue: false);
  if (!isTestEnv) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the app router
    final themeMode = ref.watch(themeModeProvider);
    LogService.d('Harmoniq App started');
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Harmoniq',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
