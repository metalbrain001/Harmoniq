// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:go_router/go_router.dart';
// import 'package:harmoniq/core/services/local_auth/local_auth_service.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show splash while loading auth state
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         if (snapshot.hasData) {
//           // User is logged in
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             context.goNamed('home');
//           });
//         } else {
//           // Not logged in
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             context.goNamed('login');
//           });
//         }

//         return const SizedBox.shrink(); // Prevent rebuild glitches
//       },
//     );
//   }
// }
// Modified SplashScreen with biometrics fallback
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/local_auth/local_auth_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _handleRedirect(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    final localAuth = LocalAuthService();

    if (user != null) {
      final canUseBiometrics = await localAuth.isBiometricAvailable();

      if (canUseBiometrics) {
        final authenticated = await localAuth.authenticateWithFallback(
          reason: 'Please authenticate to continue',
        );

        if (authenticated && context.mounted) {
          context.goNamed('home');
        } else if (context.mounted) {
          context.goNamed('login');
        }
      } else {
        if (context.mounted) context.goNamed('login');
      }
    } else {
      if (context.mounted) context.goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _handleRedirect(context),
    );
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
