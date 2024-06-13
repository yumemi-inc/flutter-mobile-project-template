import 'package:cores_navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';

final class DebugNavigatorImpl implements DebugNavigator {
  const DebugNavigatorImpl();

  @override
  void goNavigationPage(BuildContext context) {
    const NavigationPageRoute().go(context);
  }

  @override
  void goPageA(BuildContext context) {
    const PageARoute().go(context);
  }

  @override
  void goPageB(BuildContext context) {
    const PageBRoute().go(context);
  }
}
