import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Badge
/// https://api.flutter.dev/flutter/material/Badge-class.html

@UseCase(
  name: 'Badge',
  type: Badge,
  path: '[Theme Preview]/Communication',
)
Widget badge(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              child: Icon(Icons.notifications),
            ),
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.notifications),
            ),
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {},
            icon: Badge.count(
              count: 99,
              child: const Icon(Icons.notifications),
            ),
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {},
            icon: Badge(
              backgroundColor: Theme.of(context).colorScheme.error,
              label: const Text('NEW'),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(Icons.notifications),
            ),
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              isLabelVisible: false,
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
    );
