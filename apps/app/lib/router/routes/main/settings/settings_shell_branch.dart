part of 'package:flutter_app/router/provider/router.dart';

const settingsShellBranch = TypedStatefulShellBranch<SettingsShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingPageRoute>(
      path: SettingPageRoute.path,
      routes: [
        TypedGoRoute<LicensePageRoute>(
          path: LicensePageRoute.path,
        ),
      ],
    ),
  ],
);

class SettingsShellBranch extends StatefulShellBranchData {
  const SettingsShellBranch();
}

class SettingPageRoute extends GoRouteData {
  const SettingPageRoute();

  static const path = '/setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        settingNavigatorProvider.overrideWithValue(
          const SettingNavigatorImpl(),
        ),
      ],
      child: const SettingPage(),
    );
  }
}

class LicensePageRoute extends GoRouteData {
  const LicensePageRoute();

  static const path = 'license';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LicensePage();
  }
}
