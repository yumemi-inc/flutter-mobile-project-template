import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Chip',
    testScenarios: [
      const TestScenario(
        child: Chip(
          avatar: CircleAvatar(),
          label: Text('Aaron Burr'),
        ),
      ),
    ],
  );
}
