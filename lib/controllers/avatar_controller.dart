import 'package:get/get.dart';
import '../models/avatar_model.dart';

class AvatarController extends GetxController
    with StateMixin<List<AvatarModel>> {
  final List<AvatarModel> _allAvatars = [];

  final RxSet<Gender> genderFilter = <Gender>{}.obs;
  final RxSet<AgeFilter> ageFilter = <AgeFilter>{}.obs;
  final RxSet<Pose> poseFilter = <Pose>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAvatars();
  }

  Future<void> fetchAvatars() async {
    change(null, status: RxStatus.loading());

    final names = [
      'Jennifer',
      'Mary',
      'Tim',
      'Alex',
      'Sophia',
      'Chris',
      'Emma',
      'Daniel',
      'Olivia',
      'Ethan',
    ];

    final imagePaths = [
      'assets/images/im_avatar_1.png',
      'assets/images/im_avatar_2.png',
      'assets/images/im_avatar_3.png',
      'assets/images/im_avatar_4.png',
      'assets/images/im_avatar_5.png',
      'assets/images/im_avatar_6.png',
      'assets/images/im_avatar_7.png',
    ];

    _allAvatars.clear();

    for (int i = 0; i < 20; i++) {
      final name = names[i % names.length];
      final gender = i % 2 == 0 ? Gender.female : Gender.male;
      final age = 18 + (i * 3) % 60; // 18–77?
      final imagePath = imagePaths[i % imagePaths.length];
      final pose = Pose.values[i % Pose.values.length];

      _allAvatars.add(
        AvatarModel(
          id: 'av_$i',
          name: name,
          age: age,
          gender: gender,
          pose: pose,
          imagePath: imagePath,
        ),
      );
    }

    _applyFilters();
  }

  void applyGenderFilter(final Set<Gender> genders) {
    genderFilter
      ..clear()
      ..addAll(genders);
    _applyFilters();
  }

  void applyAgeFilter(final Set<AgeFilter> ages) {
    ageFilter
      ..clear()
      ..addAll(ages);
    _applyFilters();
  }

  void applyPoseFilter(final Set<Pose> poses) {
    poseFilter
      ..clear()
      ..addAll(poses);
    _applyFilters();
  }

  void _applyFilters() {
    var list = List<AvatarModel>.from(_allAvatars);

    if (genderFilter.isNotEmpty) {
      list = list.where((final a) => genderFilter.contains(a.gender)).toList();
    }
    if (ageFilter.isNotEmpty) {
      list = list.where(_matchesAnyAgeFilter).toList();
    }
    if (poseFilter.isNotEmpty) {
      list = list.where((final a) => poseFilter.contains(a.pose)).toList();
    }

    if (list.isEmpty) {
      change(list, status: RxStatus.empty());
    } else {
      change(list, status: RxStatus.success());
    }
  }

  bool _matchesAnyAgeFilter(final AvatarModel a) {
    for (final filter in ageFilter) {
      switch (filter) {
        case AgeFilter.youngAdults:
          if (a.age >= 18 && a.age <= 24) return true;
          break;
        case AgeFilter.adults:
          if (a.age >= 25 && a.age <= 39) return true;
          break;
        case AgeFilter.middleAgedAdults:
          if (a.age >= 40 && a.age <= 64) return true;
          break;
        case AgeFilter.olderAdults:
          if (a.age >= 65) return true;
          break;
      }
    }
    return false;
  }

  void clearFilters() {
    genderFilter.clear();
    ageFilter.clear();
    poseFilter.clear();
    _applyFilters();
  }
}
