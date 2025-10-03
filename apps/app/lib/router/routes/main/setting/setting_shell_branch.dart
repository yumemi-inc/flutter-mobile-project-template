part of 'package:flutter_app/router/router.dart';

const settingShellBranch = TypedStatefulShellBranch<SettingShellBranch>(
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

class SettingShellBranch extends StatefulShellBranchData {
  const SettingShellBranch();
}

class SettingPageRoute extends GoRouteData with _$SettingPageRoute {
  const SettingPageRoute();

  static const path = '/setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingPage(
      navigator: (
        goLicensePage: (context) => const LicensePageRoute().go(context),
      ),
    );
  }
}

class LicensePageRoute extends GoRouteData with _$LicensePageRoute {
  const LicensePageRoute();

  static const path = 'license';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LicensePage(
      applicationIcon: CommonAssets.res.assets.yumemiLogo.image(
        height: 100,
        width: 100,
      ),
    );
  }
}
