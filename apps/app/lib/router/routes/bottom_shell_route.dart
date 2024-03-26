import 'package:flutter/material.dart';
import 'package:flutter_app/feature/bottom_tab/bottom_tab.dart';
import 'package:go_router/go_router.dart';

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
