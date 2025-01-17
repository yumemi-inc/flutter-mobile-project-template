import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// TimePicker
/// https://api.flutter.dev/flutter/material/showTimePicker.html

@UseCase(
  name: 'TimePicker',
  type: TimePickerDialog,
  path: '[Theme Preview]/Selection',
)
Widget timePicker(BuildContext context) {
  final orientation = context.knobs.boolean(
    label: 'Orientation',
    initialValue: true,
  )
      ? Orientation.portrait
      : Orientation.landscape;

  return Scaffold(
    body: Center(
      child: ElevatedButton(
        onPressed: () async {
          final result = await showTimePicker(
            useRootNavigator: false,
            context: context,
            initialTime: TimeOfDay.now(),
            orientation: orientation,
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
