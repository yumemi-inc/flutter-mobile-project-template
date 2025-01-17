import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// SnackBar
/// https://api.flutter.dev/flutter/material/SnackBar-class.html

@UseCase(
  name: 'SnackBar',
  type: SnackBar,
  path: '[Theme Preview]/Communication',
)
Widget snackBar(BuildContext context) => Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('This is a snackbar'),
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {},
                ),
              ),
            );
          },
          child: const Text('Show SnackBar'),
        ),
      ),
    );
