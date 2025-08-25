import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'BottomAppBar',
    testScenarios: [
      TestScenario(
        child: Scaffold(
          body: const Center(child: Text('Body')),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
