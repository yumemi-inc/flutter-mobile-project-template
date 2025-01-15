import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// TimePicker
/// https://api.flutter.dev/flutter/material/showTimePicker.html

@UseCase(
  name: 'TimePicker',
  type: TimePickerDialog,
  path: '[Theme Preview]/Selection',
)
Widget timePicker(BuildContext context) {
  return Scaffold(
    body: Center(
      child: ElevatedButton(
        onPressed: () async {
          final result = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (context.mounted) {
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(content: Text('Result: ${result?.format(context)}')),
            );
          }
        },
        child: const Text('Show TimePicker'),
      ),
    ),
  );
}
