import 'package:go_router/go_router.dart';
import 'package:harmoniq/features/home/views/home_screen.dart';
import 'package:harmoniq/features/auth/views/register_screen.dart';
import 'package:harmoniq/features/auth/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmoniq/features/splash/views/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true, // Splash now controls redirection
  //
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        return user == null ? '/login' : null;
      },
    ),
  ],
);
