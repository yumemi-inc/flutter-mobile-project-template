import 'package:cores_navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';

final class SettingNavigatorImpl implements SettingNavigator {
  const SettingNavigatorImpl();

  @override
  void goLicensePage(BuildContext context) {
    const LicensePageRoute().go(context);
  }
}
