import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';
import 'package:flutter_app/ui/home_page.dart';

final class HomeNavigatorImpl implements HomeNavigator {
  const HomeNavigatorImpl();

  @override
  void goDebugPage(BuildContext context) {
    const DebugPageRoute().go(context);
  }

  @override
  void goWebPage(BuildContext context) {
    const WebPageRoute().go(context);
  }
}
