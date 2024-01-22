import 'package:flutter/material.dart';

class SnackBarManager {
  SnackBarManager._();

  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    if (rootScaffoldMessengerKey.currentState == null) {
      return;
    }
    rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void hideSnackBar() {
    if (rootScaffoldMessengerKey.currentState == null) {
      return;
    }
    rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
