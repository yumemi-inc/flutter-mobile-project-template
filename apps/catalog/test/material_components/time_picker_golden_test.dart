import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'TimePicker',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(widget);
      final button = find.byType(ElevatedButton);
      button.evaluate();
      for (var i = 0; i < button.found.length; i++) {
        await tester.tap(button.at(i));
      }
      await tester.pumpAndSettle(const Duration(seconds: 1));
    },
    testScenarios: [
      TestScenario(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 00, minute: 00),
                  orientation: Orientation.portrait,
                );
              },
              child: const Text('Show TimePicker'),
            );
          },
        ),
      ),
    ],
  );
}
