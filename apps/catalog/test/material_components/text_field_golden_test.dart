import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'TextField',
    testScenarios: [
      TestScenario(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Label Text',
                helperText: 'Helper Text',
                hintText: 'Hint Text',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: 'default_text_field'),
              decoration: const InputDecoration(
                labelText: 'Label Text',
                helperText: 'Helper Text',
                hintText: 'Hint Text',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: 'default_text_field'),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Label Text',
                helperText: 'Helper Text',
                hintText: 'Hint Text',
              ),
            ),
          ],
        ),
      ),
      TestScenario(
        name: 'Outlined',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Outlined',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: 'default_text_field'),
              decoration: const InputDecoration(
                labelText: 'Outlined',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: 'default_text_field'),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Outlined',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
