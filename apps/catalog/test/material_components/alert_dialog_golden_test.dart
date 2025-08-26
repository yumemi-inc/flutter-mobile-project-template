import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'AlertDialog',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(widget);
      final button = find.byType(ElevatedButton);
      button.evaluate();
      for (var i = 0; i < button.found.length; i++) {
        await tester.tap(button.at(i));
      }
      await tester.pumpAndSettle();
    },
    testScenarios: [
      TestScenario(
        child: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              unawaited(
                showDialog<void>(
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
      ),
    ],
  );
}
