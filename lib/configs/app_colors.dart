import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF1E1E1E);
  static const Color accentColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color scaffoldBackgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF2C2C2C);
  static const Color iconColor = Colors.white;
  static const Color dividerColor = Colors.white24;
  static const Color textColorPrimary = Colors.white;
  static const Color textColorSecondary = Colors.white54;

  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      error: AppColors.errorColor,
      surface: AppColors.scaffoldBackgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(color: AppColors.textColorPrimary, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.textColorPrimary, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.textColorSecondary, fontSize: 16),
    ),
    cardColor: AppColors.cardColor,
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    dividerColor: AppColors.dividerColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      iconTheme: IconThemeData(color: AppColors.iconColor),
    ),
  );
}