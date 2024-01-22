import 'package:flutter/material.dart';

class SnackBarManager {
  SnackBarManager._();

  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    if (rootScaffoldMessengerKey.currentState == null) {
      return;
    }

    /// Hide the current snackBar if it is visible
    rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
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
