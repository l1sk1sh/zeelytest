import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'themes/app_theme.dart';
import 'views/avatars/pages/avatars_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) => EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: _buildApp(),
      );

  Widget _buildApp() => Builder(builder: (final context) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          home: AvatarPage(),
        );
      });
}
