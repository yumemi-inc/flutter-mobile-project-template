import 'package:catalog/use_case/cores/designsystem/theme/selection/slider.dart';
import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Slider',
    testScenarios: [
      const TestScenario(
        child: Builder(builder: slider),
      ),
    ],
  );
}
