import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Divider
/// https://api.flutter.dev/flutter/material/Divider-class.html

@UseCase(
  name: 'Default',
  type: Divider,
  path: '[Theme Preview]/Containment',
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
  path: '[Theme Preview]/Containment',
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
