import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// IconButton
/// https://api.flutter.dev/flutter/material/IconButton-class.html

@UseCase(
  name: 'Default',
  type: IconButton,
  path: '[Theme Preview]/Actions',
)
Widget iconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Filled',
  type: IconButton,
  path: '[Theme Preview]/Actions',
)
Widget filledIconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton.filled(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Tonal',
  type: IconButton,
  path: '[Theme Preview]/Actions',
)
Widget filledTonalIconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton.filledTonal(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Outlined',
  type: IconButton,
  path: '[Theme Preview]/Actions',
)
Widget outlinedIconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton.outlined(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
