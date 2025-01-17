import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  Widget cardContainer(String name) => InkWell(
        onTap: () {},
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(name)),
        ),
      );
  goldenTestsGroup(
    componentName: 'Card',
    testScenarios: [
      TestScenario(
        name: 'Elevated',
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: cardContainer('Elevated Card'),
          ),
        ),
      ),
      TestScenario(
        name: 'Outlined',
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card.outlined(
            clipBehavior: Clip.hardEdge,
            child: cardContainer('Outlined Card'),
          ),
        ),
      ),
      TestScenario(
        name: 'Filled',
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card.filled(
            clipBehavior: Clip.hardEdge,
            child: cardContainer('Filled Card'),
          ),
        ),
      ),
    ],
  );
}
