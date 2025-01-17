import 'package:catalog/use_case/cores/designsystem/theme/selection/radio.dart';
import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Radio',
    testScenarios: [
      const TestScenario(
        child: Builder(builder: radio),
      ),
    ],
  );
}
