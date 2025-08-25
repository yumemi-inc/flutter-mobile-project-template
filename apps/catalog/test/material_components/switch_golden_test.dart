import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Switch',
    testScenarios: [
      TestScenario(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: true,
              onChanged: (newValue) {},
            ),
            const SizedBox(width: 8),
            Switch(
              value: false,
              onChanged: (newValue) {},
            ),
            const SizedBox(width: 8),
            const Switch(
              value: false,
              onChanged: null,
            ),
          ],
        ),
      ),
    ],
  );
}
