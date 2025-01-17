import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'NavigationRail',
    testScenarios: [
      TestScenario(
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('First'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark),
                    label: Text('Second'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star),
                    label: Text('Third'),
                  ),
                ],
                selectedIndex: 0,
                labelType: NavigationRailLabelType.all,
              ),
              const VerticalDivider(thickness: 1, width: 1),
              const Expanded(
                child: Center(child: Text('Body')),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
