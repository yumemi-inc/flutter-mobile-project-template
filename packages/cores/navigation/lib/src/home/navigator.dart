import 'package:flutter/material.dart';

abstract interface class HomeNavigator {
  void goDebugModePage(BuildContext context);
  void goSettingPage(BuildContext context);
  void goWebView(BuildContext context);
}
