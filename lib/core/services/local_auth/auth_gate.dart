// import 'package:flutter/material.dart';
// import 'package:harmoniq/core/services/local_auth/local_auth_service.dart';

// class AuthGate extends StatelessWidget {
//   final Widget child;
//   final String reason;
//   const AuthGate({
//     super.key,
//     required this.child,
//     this.reason = 'Authenticate',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: LocalAuthService().authenticateWithFallback(reason: reason),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.data == true) {
//           return child;
//         } else {
//           return const Center(child: Text('Authentication required'));
//         }
//       },
//     );
//   }
// }
// This widget can be used to wrap any screen that requires authentication.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/local_auth/local_auth_service.dart';

class AuthGate extends StatelessWidget {
  final Widget child;
  final String reason;
  const AuthGate({
    super.key,
    required this.child,
    this.reason = 'Authenticate',
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: LocalAuthService().authenticateWithFallback(reason: reason),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data == true) {
          return child;
        } else {
          // ❌ Redirect to password screen if biometric fails
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/welcome-back');
          });
          return const SizedBox(); // Empty screen while redirecting
        }
      },
    );
  }
}
