// lib/helper/enum/app_enum.dart

enum AppRoute {
  splash,
  home,
  login,
  register,
  welcome,
  welcomeBack,
  onboarding,
  passwordLogin,
  biometricLogin,
  settings,
  profile,
  notifications,
  about,
  help,
  feedback,
  termsAndConditions,
  privacyPolicy,
  logout,
}

extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.splash:
        return '/';
      case AppRoute.home:
        return '/home';
      case AppRoute.login:
        return '/login';
      case AppRoute.register:
        return '/register';
      case AppRoute.welcome:
        return '/welcome';
      case AppRoute.welcomeBack:
        return '/welcome-back';
      case AppRoute.onboarding:
        return '/onboarding';
      case AppRoute.passwordLogin:
        return '/password-login';
      case AppRoute.biometricLogin:
        return '/biometric-login';
      case AppRoute.settings:
        return '/settings';
      case AppRoute.profile:
        return '/profile';
      case AppRoute.notifications:
        return '/notifications';
      case AppRoute.about:
        return '/about';
      case AppRoute.help:
        return '/help';
      case AppRoute.feedback:
        return '/feedback';
      case AppRoute.termsAndConditions:
        return '/terms-and-conditions';
      case AppRoute.privacyPolicy:
        return '/privacy-policy';
      case AppRoute.logout:
        return '/logout';
    }
  }

  String get name {
    return toString().split('.').last;
  }
}
