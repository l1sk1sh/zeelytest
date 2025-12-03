import 'package:flutter/material.dart';

sealed class AppColors {
  AppColors._();

  // Brand colors
  static const Color primary = Color(0xFF000000);

  // Elements
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color surfaceTint = Colors.transparent;
  static const Color iconPrimary = Color(0xFF000000);
  static final Color overlay = const Color(0xFF000000).withValues(alpha: 0.5);
  static const Color borderPrimary = Color(0xFFF2F4F6);
  static const Color borderSecondary = Color(0xFFCAD4DD);

  // Typography
  static const Color textPrimary = Color.fromARGB(255, 21, 21, 21);
  static const Color textPrimaryLight = Color.fromARGB(255, 255, 255, 255);
  static const Color textSecondary = Color(0xFFACACAC);

  // Chrome
  static const chrome = Colors.transparent;

  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black54,
    ],
  );
}
