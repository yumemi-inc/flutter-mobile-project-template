//
// ignore_for_file: diagnostic_describe_all_properties

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class _ExampleDestination {
  const _ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<_ExampleDestination> _destinations = <_ExampleDestination>[
  _ExampleDestination(
    'Messages',
    Icon(Icons.widgets_outlined),
    Icon(Icons.widgets),
  ),
  _ExampleDestination(
    'Profile',
    Icon(Icons.format_paint_outlined),
    Icon(Icons.format_paint),
  ),
  _ExampleDestination(
    'Settings',
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
  ),
];

class _NavigationDrawerExample extends StatefulWidget {
  const _NavigationDrawerExample();

  @override
  State<_NavigationDrawerExample> createState() =>
      _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<_NavigationDrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Page Index = $screenIndex'),
              ElevatedButton(
                onPressed: openDrawer,
                child: const Text('Open Drawer'),
              ),
            ],
          ),
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
            ),
          ),
          ..._destinations.map(
            (destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}

/// NavigationDrawer
/// https://api.flutter.dev/flutter/material/NavigationDrawer-class.html

@UseCase(
  name: 'NavigationDrawer',
  type: NavigationDrawer,
  path: '[Theme Preview]/Navigation',
)
Widget navigationDrawer(BuildContext context) =>
    const _NavigationDrawerExample();
