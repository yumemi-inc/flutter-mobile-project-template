import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'AppBar',
    testScenarios: [
      TestScenario(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('AppBar Sample'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'alert',
                onPressed: () {},
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) => ListTile(
              title: const Text('Title'),
              subtitle: const Text('Subtitle'),
              onTap: () {},
            ),
          ),
        ),
      ),
    ],
  );
}
