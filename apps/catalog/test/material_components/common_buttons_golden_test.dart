import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'CommonButton',
    testScenarios: [
      TestScenario(
        name: 'ElevatedButton',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            const SizedBox(height: 16),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated'),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'FilledButton',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            const SizedBox(height: 16),
            const FilledButton(
              onPressed: null,
              child: Text('Filled'),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'FilledTonalButton',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Filled Tonal'),
            ),
            const SizedBox(height: 16),
            const FilledButton.tonal(
              onPressed: null,
              child: Text('Filled Tonal'),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'OutlinedButton',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            const SizedBox(height: 16),
            const OutlinedButton(
              onPressed: null,
              child: Text('Outlined'),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'TextButton',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            const SizedBox(height: 16),
            const TextButton(
              onPressed: null,
              child: Text('Text'),
            ),
          ],
        ),
      ),
    ],
  );
}
