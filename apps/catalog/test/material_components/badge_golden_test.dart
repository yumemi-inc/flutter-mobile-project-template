import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Badge',
    testScenarios: [
      TestScenario(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Badge(
                child: Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: () {},
              icon: const Badge(
                label: Text('3'),
                child: Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 99,
                child: const Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: () {},
              icon: const Badge(
                label: Text('NEW'),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: () {},
              icon: const Badge(
                isLabelVisible: false,
                child: Icon(Icons.notifications),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
