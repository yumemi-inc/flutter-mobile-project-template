import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'BottomSheet',
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
      ),
    ],
  );
}
