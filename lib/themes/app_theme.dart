import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_widget_styles.dart';

class AppTheme {
  static final base = ThemeData.light();

  static ThemeData get lightTheme {
    return base.copyWith(
      textTheme: base.textTheme.apply(
          fontFamily: 'Italian Plate No2 Expanded',
          displayColor: AppColors.textPrimary),
      primaryColor: AppColors.primary,
      colorScheme:
          const ColorScheme.light().copyWith(primary: AppColors.primary),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.surfaceTint,
          iconTheme: IconThemeData(color: AppColors.iconPrimary),
          actionsIconTheme: IconThemeData(color: AppColors.iconPrimary),
          centerTitle: false,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
          )),
      scaffoldBackgroundColor: AppColors.background,
      buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius100c),
          ),
          minWidth: double.infinity,
          height: AppDimensions.inputHeight),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: AppWidgetStyles.defaultButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: AppWidgetStyles.defaultButtonStyle
              .copyWith(minimumSize: WidgetStateProperty.all(null))),
    );
  }
}
