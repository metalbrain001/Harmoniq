import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harmoniq/core/router/app_router.dart';
import 'package:harmoniq/core/services/log_service.dart';
import 'firebase_options.dart';
import 'package:harmoniq/core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmoniq/core/services/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Only use emulators in debug mode
  if (kDebugMode) {
    const host = 'localhost'; // ✅ iOS requires localhost
    await FirebaseAuth.instance.useAuthEmulator(host, 9099);
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8085);
    LogService.d('🔥 Firebase emulator connected on iOS (localhost)');
  }

  // const isTestEnv = bool.fromEnvironment('FLUTTER_TEST', defaultValue: false);
  // if (!isTestEnv) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

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
