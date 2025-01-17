import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'DatePicker',
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
              final first = DateTime(2025);
              final last = first.add(const Duration(days: 6));
              unawaited(
                showDatePicker(
                  context: context,
                  firstDate: first,
                  lastDate: last,
                ),
              );
            },
            child: const Text('Show DatePicker'),
          ),
        ),
      ),
    ],
  );
}
