import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_dimensions.dart';

class AppClearFiltersButton extends StatelessWidget {
  const AppClearFiltersButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius8),
          border: Border.all(color: AppColors.borderPrimary),
        ),
        child: const Center(
          child: Icon(
            Icons.close,
            size: 22,
            color: AppColors.iconPrimary,
          ),
        ),
      ),
    );
  }
}
