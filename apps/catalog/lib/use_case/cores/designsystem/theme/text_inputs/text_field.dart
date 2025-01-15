import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// TextField
/// https://api.flutter.dev/flutter/material/TextField-class.html

@UseCase(
  name: 'Default',
  type: TextField,
  path: '[Theme Preview]/TextInputs',
)
Widget textField(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          obscureText: context.knobs.boolean(label: 'Obscure'),
          decoration: const InputDecoration(
            labelText: 'Label Text',
            helperText: 'Helper Text',
            hintText: 'Hint Text',
          ),
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Outline',
  type: TextField,
  path: '[Theme Preview]/TextInputs',
)
Widget outlinedTextField(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          obscureText: context.knobs.boolean(label: 'Obscure'),
          decoration: const InputDecoration(
            labelText: 'Outlined',
            hintText: 'hint text',
            helperText: 'supporting text',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );
}
