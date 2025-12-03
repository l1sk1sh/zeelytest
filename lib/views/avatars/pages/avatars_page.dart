import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../controllers/avatar_controller.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../models/avatar_model.dart';
import '../../../themes/app_dimensions.dart';
import '../../../themes/app_images.dart';
import '../../../themes/app_text_styles.dart';
import '../../../themes/app_widget_styles.dart';
import '../../_widgets/bottom_sheet_filter.dart';
import '../../_widgets/clear_filter_button.dart';
import '../../_widgets/filter_chip.dart';
import '../_widgets/avatar_tile_widget.dart';

class AvatarPage extends StatelessWidget {
  AvatarPage({super.key});

  final AvatarController controller = Get.put(AvatarController());

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.avatar_ttl.tr(),
          style: AppTextStyles.t25Bold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.dimen8),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.dimen16),
        _buildFilters(context),
        const SizedBox(height: AppDimensions.dimen16),
        Expanded(
          child: controller.obx(
            (final avatars) => GridView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: avatars!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (final context, final index) {
                return AvatarTile(avatar: avatars[index]);
              },
            ),
            onLoading: _buildLoadingBody(),
            onEmpty: _buildEmptyBody(),
            // TODO: Custom error?
            onError: (final err) => Center(
              child: Text('Error: $err'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters(final BuildContext context) {
    return Obx(() {
      final hasAnyFilter = controller.genderFilter.isNotEmpty ||
          controller.ageFilter.isNotEmpty ||
          controller.poseFilter.isNotEmpty;

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            if (hasAnyFilter) ...[
              AppClearFiltersButton(
                onTap: controller.clearFilters,
              ),
              const SizedBox(width: AppDimensions.dimen8),
            ],
            AppFilterChip(
              label: LocaleKeys.avatar_filter_gender.tr(),
              count: controller.genderFilter.length,
              onTap: () => _openGenderSheet(context),
            ),
            const SizedBox(width: AppDimensions.dimen8),
            AppFilterChip(
              label: LocaleKeys.avatar_filter_age.tr(),
              count: controller.ageFilter.length,
              onTap: () => _openAgeSheet(context),
            ),
            const SizedBox(width: AppDimensions.dimen8),
            AppFilterChip(
              label: LocaleKeys.avatar_filter_pose.tr(),
              count: controller.poseFilter.length,
              onTap: () => _openPoseSheet(context),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLoadingBody() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset(AppImages.plasticBasket),
          ),
          Text(
            LocaleKeys.avatar_filter_not_found.tr(),
            style: AppTextStyles.t22Bold,
          ),
          const SizedBox(height: AppDimensions.dimen16),
          // TODO: extract as a common component
          ElevatedButton(
              onPressed: _clearFilters,
              style: AppWidgetStyles.outlinedButtonStyle,
              child: Text(
                LocaleKeys.avatar_filter_clear.tr(),
                style: AppTextStyles.t16Demibold,
              )),
        ],
      ),
    );
  }

  void _clearFilters() {
    controller.clearFilters();
  }

  void _openGenderSheet(final BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (final _) => AppFilterBottomSheet<Gender>(
        title: LocaleKeys.avatar_filter_gender.tr(),
        initialValues: controller.genderFilter,
        options: [
          AppFilterOption(
            label: LocaleKeys.avatar_filter_male.tr(),
            value: Gender.male,
          ),
          AppFilterOption(
            label: LocaleKeys.avatar_filter_female.tr(),
            value: Gender.female,
          ),
        ],
        onSave: controller.applyGenderFilter,
      ),
    );
  }

  void _openAgeSheet(final BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (final _) => AppFilterBottomSheet<AgeFilter>(
        title: LocaleKeys.avatar_filter_age.tr(),
        initialValues: controller.ageFilter,
        options: [
          AppFilterOption(
            label: LocaleKeys.avatar_filter_young.tr(),
            subtitle: '18-24',
            value: AgeFilter.youngAdults,
          ),
          AppFilterOption(
            label: LocaleKeys.avatar_filter_adult.tr(),
            subtitle: '25-39',
            value: AgeFilter.adults,
          ),
          AppFilterOption(
            label: LocaleKeys.avatar_filter_middle.tr(),
            subtitle: '40-64',
            value: AgeFilter.middleAgedAdults,
          ),
          AppFilterOption(
            label: LocaleKeys.avatar_filter_older.tr(),
            subtitle: '65+',
            value: AgeFilter.olderAdults,
          ),
        ],
        onSave: controller.applyAgeFilter,
      ),
    );
  }

// TODO: tr()
  void _openPoseSheet(final BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (final _) => AppFilterBottomSheet<Pose>(
        title: LocaleKeys.avatar_filter_pose.tr(),
        initialValues: controller.poseFilter,
        options: [
          AppFilterOption(
            label: 'Standing',
            value: Pose.standing,
          ),
          AppFilterOption(
            label: 'Sitting',
            value: Pose.sitting,
          ),
          AppFilterOption(
            label: 'Selfie',
            value: Pose.selfie,
          ),
          AppFilterOption(
            label: 'Car selfie',
            value: Pose.carSelfie,
          ),
          AppFilterOption(
            label: 'Walking',
            value: Pose.walking,
          ),
        ],
        onSave: controller.applyPoseFilter,
      ),
    );
  }
}
