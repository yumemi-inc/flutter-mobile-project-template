import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Checkbox',
    testScenarios: [
      TestScenario(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            Checkbox(value: false, onChanged: (value) {}),
          ],
        ),
      ),
    ],
  );
}
