import 'package:cores_core/util.dart';
import 'package:cores_navigation/providers.dart';
import 'package:features_debug_mode/ui.dart';
import 'package:features_github_repository/ui.dart';
import 'package:features_webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_app/router/navigator/home_navigator.dart';
import 'package:flutter_app/router/routes/setting_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'home_route.g.dart';

@TypedStatefulShellRoute<MainPageRoute>(
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
class MainPageRoute extends StatefulShellRouteData {
  const MainPageRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainPage(navigationShell: navigationShell);
  }
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomAppLifecycleListener(
      onResume: () {
        // Example: Obtain the latest AppStatus and update if needed.
      },
      // By overriding the Provider in the Route build method, it is possible to
      // switch the implementation of Navigator based on the source of
      // navigation or the state.
      child: ProviderScope(
        overrides: [
          homeNavigatorProvider.overrideWithValue(const HomeNavigatorImpl()),
        ],
        child: const HomePage(),
      ),
    );
  }
}

class DebugModePageRoute extends GoRouteData {
  const DebugModePageRoute();

  static const path = 'debug_mode';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DebugModePage();
  }
}

class WebViewRoute extends GoRouteData {
  const WebViewRoute();

  static const path = 'web_view';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebView(
      initialUrl: Uri.parse('https://flutter.dev'),
      pop: context.pop,
    );
  }
}

@TypedGoRoute<MaintenancePageRoute>(
  path: MaintenancePageRoute.path,
)
class MaintenancePageRoute extends GoRouteData {
  const MaintenancePageRoute();

  static const path = '/maintenance';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MaintenanceModePage();
  }
}

class GithubRepositoryDetailPageRoute extends GoRouteData {
  const GithubRepositoryDetailPageRoute(this.repositoryName);

  final String repositoryName;

  static const path = 'github_repository_detail';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GithubRepositoryDetailPage(repositoryName: repositoryName);
  }
}
