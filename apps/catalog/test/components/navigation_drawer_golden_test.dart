import 'package:catalog/use_case/cores/designsystem/theme/navigation/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'NavigationDrawer',
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
      const TestScenario(
        child: Builder(builder: navigationDrawer),
      ),
    ],
  );
}
