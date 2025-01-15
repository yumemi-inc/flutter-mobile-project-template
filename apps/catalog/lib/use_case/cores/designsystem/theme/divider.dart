import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: Divider,
  path: '[Theme Preview]',
)
Widget divider(BuildContext context) => const Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Above'),
            Divider(),
            Text('Below'),
          ],
        ),
      ),
    );

@UseCase(
  name: 'Vertical',
  type: Divider,
  path: '[Theme Preview]',
)
Widget verticalDivider(BuildContext context) => const Center(
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Left'),
            VerticalDivider(),
            Text('Right'),
          ],
        ),
      ),
    );
