import 'package:flutter/material.dart';
import '../../../models/avatar_model.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_dimensions.dart';
import '../../../themes/app_text_styles.dart';

class AvatarTile extends StatelessWidget {
  const AvatarTile({super.key, required this.avatar});

  final AvatarModel avatar;

  @override
  Widget build(final BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radius8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            avatar.imagePath,
            fit: BoxFit.cover,
          ),
          Container(
            decoration:
                const BoxDecoration(gradient: AppColors.primaryGradient),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.dimen8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  avatar.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.t14DemiboldLight,
                ),
                Text(
                  '${avatar.genderText} · ${avatar.age}',
                  style: AppTextStyles.t10RegularLight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
