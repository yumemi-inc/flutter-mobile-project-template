import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'ProgressIndicator',
    pumpBeforeTest: (tester) async {
      await tester.pump(const Duration(milliseconds: 500));
    },
    testScenarios: [
      const TestScenario(
        name: 'Circular',
        child: CircularProgressIndicator(),
      ),
      const TestScenario(
        name: 'Linear',
        child: LinearProgressIndicator(),
      ),
    ],
  );
}
