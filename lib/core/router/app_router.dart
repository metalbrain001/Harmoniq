// import 'package:go_router/go_router.dart';
// import 'package:harmoniq/features/home/views/home_screen.dart';
// import 'package:harmoniq/features/auth/views/register_screen.dart';
// import 'package:harmoniq/features/auth/views/login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:harmoniq/features/onboarding/view/harmoniq_ob_screen.dart';
// import 'package:harmoniq/features/splash/views/splash_screen.dart';
// import 'package:harmoniq/features/welcome/views/welcome_back_screen.dart';
// import 'package:harmoniq/features/welcome/views/welcome_screen.dart';
// import 'package:harmoniq/helper/enum/app_enum.dart';

// final GoRouter appRouter = GoRouter(
//   debugLogDiagnostics: true, // Splash now controls redirection
//   //
//   initialLocation: AppRoute.onboarding.path,
//   routes: [
//     GoRoute(
//       path: '/',
//       name: 'splash',
//       builder: (context, state) => const SplashScreen(),
//     ),
//     GoRoute(
//       path: '/onboarding',
//       name: 'onboarding',
//       builder: (context, state) => const HarmoniqOnboardingScreen(),
//     ),
//     // WelcomeScreen is now part of the onboarding process
//     GoRoute(
//       path: '/welcome',
//       name: 'welcome',
//       builder: (context, state) => const WelcomeScreen(),
//     ),
//     GoRoute(
//       path: '/welcome-back',
//       name: 'welcome-back',
//       builder: (context, state) => const WelcomeBackScreen(),
//     ),

//     GoRoute(
//       path: '/login',
//       name: 'login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/register',
//       name: 'register',
//       builder: (context, state) => const RegisterScreen(),
//     ),
//     GoRoute(
//       path: '/home',
//       name: 'home',
//       builder: (context, state) => const HomeScreen(),
//       redirect: (context, state) {
//         final user = FirebaseAuth.instance.currentUser;
//         return user == null ? '/login' : null;
//       },
//     ),
//   ],
// );
import 'package:go_router/go_router.dart';
import 'package:harmoniq/features/home/views/home_screen.dart';
import 'package:harmoniq/features/auth/views/register_screen.dart';
import 'package:harmoniq/features/auth/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmoniq/features/onboarding/view/harmoniq_ob_screen.dart';
import 'package:harmoniq/features/splash/views/splash_screen.dart';
import 'package:harmoniq/features/welcome/views/welcome_back_screen.dart';
import 'package:harmoniq/features/welcome/views/welcome_screen.dart';
import 'package:harmoniq/helper/enum/app_enum.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true, // Splash now controls redirection
  //
  initialLocation: AppRoute.onboarding.path,
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      name: AppRoute.splash.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.onboarding.path,
      name: AppRoute.onboarding.name,
      builder: (context, state) => const HarmoniqOnboardingScreen(),
    ),
    // WelcomeScreen is now part of the onboarding process
    GoRoute(
      path: AppRoute.welcome.path,
      name: AppRoute.welcome.name,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoute.welcomeBack.path,
      name: AppRoute.welcomeBack.name,
      builder: (context, state) => const WelcomeBackScreen(),
    ),

    GoRoute(
      path: AppRoute.login.path,
      name: AppRoute.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoute.register.path,
      name: AppRoute.register.name,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        return user == null ? '/login' : null;
      },
    ),
  ],
);
