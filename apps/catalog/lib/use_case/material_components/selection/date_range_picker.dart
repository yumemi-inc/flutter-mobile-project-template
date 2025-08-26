import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// DateRangePicker
/// https://api.flutter.dev/flutter/material/showDateRangePicker.html

@UseCase(
  name: 'DateRangePicker',
  type: DateRangePickerDialog,
  path: '[Theme Preview]/Selection',
)
Widget dateRangePicker(BuildContext context) {
  return Scaffold(
    body: Center(
      child: ElevatedButton(
        onPressed: () async {
          final first = DateTime.now();
          final last = first.add(const Duration(days: 6));
          final result = await showDateRangePicker(
            context: context,
            firstDate: first,
            lastDate: last,
            useRootNavigator: false,
          );
          if (context.mounted) {
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(
                content: Text('Result: ${result?.start} - ${result?.end}'),
              ),
            );
          }
        },
        child: const Text('Show DateRangePicker'),
      ),
    ),
  );
}
