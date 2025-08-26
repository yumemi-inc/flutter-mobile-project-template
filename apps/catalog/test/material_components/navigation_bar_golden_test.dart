import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'NavigationBar',
    testScenarios: [
      TestScenario(
        child: Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) {},
            selectedIndex: 1,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.notifications_sharp)),
                label: 'Notifications',
              ),
              NavigationDestination(
                icon: Badge(
                  label: Text('2'),
                  child: Icon(Icons.messenger_sharp),
                ),
                label: 'Messages',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
