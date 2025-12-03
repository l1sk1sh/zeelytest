import 'package:flutter/services.dart';

import 'app_colors.dart';

sealed class AppChrome {
  AppChrome._();

  static void setupChrome() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.chrome,
        systemNavigationBarColor: AppColors.chrome,
        systemNavigationBarDividerColor: AppColors.chrome,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
