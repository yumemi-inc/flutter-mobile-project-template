import 'package:cores_navigation/providers.dart';
import 'package:features_setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/navigator/setting_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final class SettingPageRoute extends GoRouteData {
  const SettingPageRoute();

  static const path = 'setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        settingNavigatorProvider.overrideWithValue(const SettingNavigatorImpl()),
      ],
      child: const SettingPage(),
    );
  }
}

final class LicensePageRoute extends GoRouteData {
  const LicensePageRoute();

  static const path = 'license';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LicensePage();
  }
}
