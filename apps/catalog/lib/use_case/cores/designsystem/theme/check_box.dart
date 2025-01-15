import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: Checkbox,
  path: '[Theme Preview]',
)
Widget checkbox(BuildContext context) {
  bool? isChecked = true;

  return Center(
    child: StatefulBuilder(
      builder: (context, setState) {
        return Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() => isChecked = value);
          },
        );
      },
    ),
  );
}
