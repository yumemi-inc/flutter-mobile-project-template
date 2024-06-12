import 'package:cores_navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';

final class NavigationNavigatorImpl implements NavigationNavigator {
  const NavigationNavigatorImpl();

  @override
  void goNavigationPage(BuildContext context) {
    const NavigationPageRoute().go(context);
  }
}
