import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Common Buttons
/// https://api.flutter.dev/flutter/material/ButtonStyle-class.html

@UseCase(
  name: 'ElevatedButton',
  type: ElevatedButton,
  path: '[Theme Preview]/Actions/Common',
)
Widget elevatedButton(BuildContext context) => Center(
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
    );

@UseCase(
  name: 'Default',
  type: FilledButton,
  path: '[Theme Preview]/Actions/Common',
)
Widget filledButton(BuildContext context) => Center(
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
    );

@UseCase(
  name: 'Tonal',
  type: FilledButton,
  path: '[Theme Preview]/Actions/Common',
)
Widget filledTonalButton(BuildContext context) => Center(
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
    );

@UseCase(
  name: 'OutlinedButton',
  type: OutlinedButton,
  path: '[Theme Preview]/Actions/Common',
)
Widget outlinedButton(BuildContext context) => Center(
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
    );

@UseCase(
  name: 'TextButton',
  type: TextButton,
  path: '[Theme Preview]/Actions/Common',
)
Widget textButton(BuildContext context) => Center(
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
    );
