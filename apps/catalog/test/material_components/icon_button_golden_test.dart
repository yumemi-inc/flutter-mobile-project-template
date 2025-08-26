import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'IconButton',
    testScenarios: [
      TestScenario(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(height: 16),
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'Filled',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton.filled(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(height: 16),
            const IconButton.filled(
              onPressed: null,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'FilledTonal',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(height: 16),
            const IconButton.filledTonal(
              onPressed: null,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'Outlined',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(height: 16),
            const IconButton.outlined(
              onPressed: null,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    ],
  );
}
