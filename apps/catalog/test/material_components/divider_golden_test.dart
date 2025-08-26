import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Divider',
    testScenarios: [
      const TestScenario(
        name: 'Horizontal',
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Above'),
              Divider(),
              Text('Below'),
            ],
          ),
        ),
      ),
      const TestScenario(
        name: 'Vertical',
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Left'),
              VerticalDivider(),
              Text('Right'),
            ],
          ),
        ),
      ),
    ],
  );
}
