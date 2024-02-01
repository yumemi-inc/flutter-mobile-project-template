import 'dart:async';

import 'package:cores_core/util.dart';
import 'package:cores_navigation/providers.dart';
import 'package:features_debug_mode/ui.dart';
import 'package:features_setting/setting.dart';
import 'package:features_webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/home/ui/home_navigator.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: HomePageRoute.path,
  routes: [
    TypedGoRoute<SettingPageRoute>(
      path: SettingPageRoute.path,
    ),
    TypedGoRoute<DebugModePageRoute>(
      path: DebugModePageRoute.path,
    ),
    TypedGoRoute<WebViewRoute>(
      path: WebViewRoute.path,
    ),
  ],
)
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

class SettingPageRoute extends GoRouteData {
  const SettingPageRoute();

  static const path = 'setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
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
      initialUrl: 'https://flutter.dev',
      pop: context.pop,
    );
  }
}
