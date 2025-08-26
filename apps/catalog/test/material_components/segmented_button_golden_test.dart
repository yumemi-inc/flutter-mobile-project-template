import 'package:catalog/use_case/material_components/actions/segmented_button.dart';
import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'SegmentedButton',
    testScenarios: [
      const TestScenario(
        child: Builder(builder: segmentedButton),
      ),
    ],
  );
}
