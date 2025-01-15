import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Chip',
  type: Chip,
  path: '[Theme Preview]/Selection',
)
Widget chip(BuildContext context) => const Chip(
      avatar: CircleAvatar(),
      label: Text('Aaron Burr'),
    );
