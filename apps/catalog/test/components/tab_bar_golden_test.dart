import 'package:catalog/use_case/cores/designsystem/theme/navigation/tab_bar.dart';
import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'TabBar',
    testScenarios: [
      const TestScenario(
        child: Builder(builder: tabBar),
      ),
    ],
  );
}
