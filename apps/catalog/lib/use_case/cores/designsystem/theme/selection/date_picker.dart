import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// DatePicker
/// https://api.flutter.dev/flutter/material/showDatePicker.html

@UseCase(
  name: 'DatePicker',
  type: DatePickerDialog,
  path: '[Theme Preview]/Selection',
)
Widget datePicker(BuildContext context) {
  return Scaffold(
    body: Center(
      child: ElevatedButton(
        onPressed: () async {
          final first = DateTime.now();
          final last = first.add(const Duration(days: 6));
          final result = await showDatePicker(
            context: context,
            firstDate: first,
            lastDate: last,
            useRootNavigator: false,
          );
          if (context.mounted) {
            ScaffoldMessenger.maybeOf(context)
                ?.showSnackBar(SnackBar(content: Text('Result: $result')));
          }
        },
        child: const Text('Show DatePicker'),
      ),
    ),
  );
}
