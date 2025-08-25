import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'FloatingActionButton',
    testScenarios: [
      TestScenario(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.small(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton.large(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Create'),
            ),
            const SizedBox(height: 16),
            const FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    ],
  );
}
