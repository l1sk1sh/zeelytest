import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';

sealed class AppWidgetStyles {
  static ButtonStyle defaultButtonStyle = ButtonStyle(
    textStyle:
        WidgetStateProperty.all<TextStyle>(AppTextStyles.t16DemiboldLight),
    backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
    foregroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
    minimumSize: WidgetStateProperty.all<Size?>(
        const Size(double.infinity, AppDimensions.inputHeight)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius100c))),
  );

  static ButtonStyle outlinedButtonStyle = ButtonStyle(
    textStyle:
        WidgetStateProperty.all<TextStyle>(AppTextStyles.t16DemiboldLight),
    backgroundColor: WidgetStateProperty.all<Color>(AppColors.background),
    foregroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
    minimumSize: WidgetStateProperty.all<Size?>(
        const Size(0, AppDimensions.inputHeight)),
    elevation: WidgetStateProperty.all<double>(0),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius100c),
        side: const BorderSide(
          color: AppColors.borderSecondary,
        ),
      ),
    ),
  );
}
