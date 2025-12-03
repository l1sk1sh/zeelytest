import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_dimensions.dart';
import '../../themes/app_text_styles.dart';

class AppFilterOption<T> {
  AppFilterOption({
    required this.label,
    this.subtitle,
    required this.value,
  });

  final String label;
  final String? subtitle;
  final T value;
}

class AppFilterBottomSheet<T> extends StatefulWidget {
  const AppFilterBottomSheet({
    super.key,
    required this.title,
    required this.options,
    required this.onSave,
    this.initialValues = const {},
  });

  final String title;
  final List<AppFilterOption<T>> options;

  /// Currently selected values (multi-select)
  final Set<T> initialValues;

  /// Called with all selected values on apply
  final ValueChanged<Set<T>> onSave;

  @override
  State<AppFilterBottomSheet<T>> createState() =>
      _AppFilterBottomSheetState<T>();
}

class _AppFilterBottomSheetState<T> extends State<AppFilterBottomSheet<T>> {
  late Set<T> _selected;

  @override
  void initState() {
    super.initState();
    _selected = {...widget.initialValues};
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.dimen16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.dimen24,
          vertical: AppDimensions.dimen24,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppDimensions.radius28),
        ),
        child: SafeArea(
          top: false,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.t25Bold,
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.dimen24),
        ...widget.options.map(
          (final opt) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.dimen16),
            child: _OptionRow<T>(
              label: opt.label,
              subtitle: opt.subtitle,
              isSelected: _selected.contains(opt.value),
              onTap: () {
                setState(() {
                  if (_selected.contains(opt.value)) {
                    _selected.remove(opt.value);
                  } else {
                    _selected.add(opt.value);
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.dimen24),
        SizedBox(
          width: double.infinity,
          height: AppDimensions.inputHeight,
          child: ElevatedButton(
            onPressed: () {
              widget.onSave(_selected);
              Navigator.of(context).pop();
            },
            child: Text(
              LocaleKeys.avatar_filter_apply.tr(),
              style: AppTextStyles.t16DemiboldLight,
            ),
          ),
        ),
      ],
    );
  }
}

class _OptionRow<T> extends StatelessWidget {
  const _OptionRow({
    required this.label,
    this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: subtitle == null
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.t16Demibold),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: AppTextStyles.t14Regular,
                ),
              ],
            ],
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
              border: Border.all(
                color: isSelected
                    ? AppColors.iconPrimary
                    : AppColors.borderPrimary,
                width: 2,
              ),
              color: isSelected ? AppColors.iconPrimary : AppColors.background,
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: AppColors.borderPrimary,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
