import 'package:flutter/material.dart';

import 'app_colors.dart';

sealed class AppTextStyles {
  AppTextStyles._();

  static TextStyle t25Bold = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );

  static TextStyle t22Bold = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static TextStyle t22BoldLight = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle t16DemiboldLight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle t14RegularLight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle t14DemiboldLight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle t10RegularLight = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle t14Demibold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle t16Demibold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle t14Regular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
