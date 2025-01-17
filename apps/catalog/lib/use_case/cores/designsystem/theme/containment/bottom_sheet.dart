import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// BottomSheet
/// https://api.flutter.dev/flutter/material/BottomSheet-class.html

@UseCase(
  name: 'BottomSheet',
  type: BottomSheet,
  path: '[Theme Preview]/Containment',
)
Widget bottomSheet(BuildContext context) => Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            unawaited(
              showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Modal BottomSheet'),
                          ElevatedButton(
                            child: const Text('Close BottomSheet'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: const Text('Show BottomSheet'),
        ),
      ),
    );
