import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_app/feature/setting/ui/setting_page.dart';
import 'package:go_router/go_router.dart';

part 'router_config.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: HomePageRoute.path,
)
class HomePageRoute extends GoRouteData {
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage(
      onSettingIconPressed: () => unawaited(
        SettingPageRoute().push(context),
      ),
    );
  }
}

@TypedGoRoute<SettingPageRoute>(
  path: SettingPageRoute.path,
)
class SettingPageRoute extends GoRouteData {
  static const path = '/setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }
}
