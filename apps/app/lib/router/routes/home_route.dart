import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_app/feature/setting/ui/setting_page.dart';
import 'package:flutter_app/util/widget/custom_app_lifecyle_listerner.dart';
import 'package:go_router/go_router.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: HomePageRoute.path,
  routes: [
    TypedGoRoute<SettingPageRoute>(
      path: SettingPageRoute.path,
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
      child: HomePage(
        goSettingPage: () => const SettingPageRoute().go(context),
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
