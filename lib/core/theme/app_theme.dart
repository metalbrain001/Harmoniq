// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:harmoniq/core/theme/app_text_helper.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: AppColors.lightBackground,
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
    ),
    fontFamily: 'SFCompact',
    textTheme: AppTextTheme.sfCompact,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: AppColors.white,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: AppColors.darkBackground,
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
    ),
    fontFamily: 'SFCompact',
    textTheme: AppTextTheme.sfCompact,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.white,
    ),
  );
}
