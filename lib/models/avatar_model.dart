import 'package:easy_localization/easy_localization.dart';

import '../generated/locale_keys.g.dart';

enum Gender { male, female }

enum Pose {
  standing,
  sitting,
  selfie,
  carSelfie,
  walking,
}

enum AgeFilter {
  youngAdults, // 18–24
  adults, // 25–39
  middleAgedAdults, // 40–64
  olderAdults, // 65+
}

class AvatarModel {
  const AvatarModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.pose,
    required this.imagePath,
  });

  final String id;
  final String name;
  final int age;
  final Gender gender;
  final Pose pose;
  final String imagePath;

  String get genderText => gender == Gender.male
      ? LocaleKeys.avatar_filter_male.tr()
      : LocaleKeys.avatar_filter_female.tr();
}
