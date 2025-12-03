import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_dimensions.dart';
import '../../themes/app_text_styles.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    required this.label,
    this.onTap,
    this.count = 0,
  });

  final String label;
  final VoidCallback? onTap;
  final int count;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius8),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: AppDimensions.dimen8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius8),
          border: Border.all(color: AppColors.borderPrimary),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.t16Demibold,
            ),
            const SizedBox(width: 4),
            if (count > 0) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  count.toString(),
                  style: AppTextStyles.t14DemiboldLight,
                ),
              ),
            ],
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppDimensions.dimen16,
            ),
          ],
        ),
      ),
    );
  }
}
