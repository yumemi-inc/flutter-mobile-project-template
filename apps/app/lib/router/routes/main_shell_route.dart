import 'package:flutter/material.dart';
import 'package:flutter_app/feature/bottom_tab/bottom_tab.dart';
import 'package:flutter_app/router/routes/home_route.dart';
import 'package:flutter_app/router/routes/setting_route.dart';
import 'package:go_router/go_router.dart';

part 'main_shell_route.g.dart';

@TypedStatefulShellRoute<BottomTabRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomePageRoute>(
          path: HomePageRoute.path,
          routes: [
            TypedGoRoute<DebugModePageRoute>(
              path: DebugModePageRoute.path,
            ),
            TypedGoRoute<WebViewRoute>(
              path: WebViewRoute.path,
            ),
            TypedGoRoute<GithubRepositoryDetailPageRoute>(
              path: GithubRepositoryDetailPageRoute.path,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
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
    ),
  ],
)
class BottomTabRoute extends StatefulShellRouteData {
  const BottomTabRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return BottomTab(navigationShell: navigationShell);
  }
}
