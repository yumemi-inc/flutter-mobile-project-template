import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// AlertDialog
/// https://api.flutter.dev/flutter/material/AlertDialog-class.html

@UseCase(
  name: 'Default',
  type: AlertDialog,
  path: '[Theme Preview]/Containment',
)
Widget alertDialog(BuildContext context) => Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            unawaited(
              showDialog<void>(
                useRootNavigator: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('This is a demo alert dialog.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
          child: const Text('Show Default Dialog'),
        ),
      ),
    );

@UseCase(
  name: 'Adaptive',
  type: AlertDialog,
  path: '[Theme Preview]/Containment',
)
Widget adaptiveAlertDialog(BuildContext context) => Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            unawaited(
              showDialog<void>(
                useRootNavigator: false,
                context: context,
                builder: (context) {
                  return AlertDialog.adaptive(
                    title: const Text('AlertDialog Title'),
                    content: const Text(
                      'AlertDialog description',
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
          child: const Text('Show Adaptive Dialog'),
        ),
      ),
    );
