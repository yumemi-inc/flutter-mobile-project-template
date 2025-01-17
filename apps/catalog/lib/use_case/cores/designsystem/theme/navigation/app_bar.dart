import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// AppBar
/// https://api.flutter.dev/flutter/material/AppBar-class.html

@UseCase(
  name: 'Default',
  type: AppBar,
  path: '[Theme Preview]/Navigation',
)
Widget appBar(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Sample'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
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
    );
