import 'package:flutter/material.dart';

class AppColors {
  static const bg = Color(0xFF0A0F1C);
  static const surface = Color(0xFF111827);
  static const surfaceAlt = Color(0xFF1A2236);
  static const border = Color(0xFF243049);
  static const accent = Color(0xFF02569B);
  static const accentBright = Color(0xFF35C3FF);
  static const textPrimary = Color(0xFFE6EDF7);
  static const textSecondary = Color(0xFF94A3B8);
  static const textMuted = Color(0xFF64748B);
}

class Breakpoints {
  static const double mobile = 720;
  static const double tablet = 1024;
}

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < Breakpoints.mobile;
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < Breakpoints.tablet;

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accentBright,
      secondary: AppColors.accent,
      surface: AppColors.surface,
      onPrimary: Colors.white,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
      fontFamily: 'Inter',
    ),
    dividerColor: AppColors.border,
  );
}
