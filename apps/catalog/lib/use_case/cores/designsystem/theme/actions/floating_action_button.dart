import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// FloatingActionButton
/// https://api.flutter.dev/flutter/material/FloatingActionButton-class.html

@UseCase(
  name: 'FloatingActionButton',
  type: FloatingActionButton,
  path: '[Theme Preview]/Actions',
)
Widget floatingActionButton(BuildContext context) => Center(
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
    );
