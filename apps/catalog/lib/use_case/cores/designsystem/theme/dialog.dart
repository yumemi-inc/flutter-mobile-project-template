import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: AlertDialog,
  path: '[Theme Preview]/Dialog',
)
Widget alertDialog(BuildContext context) => Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            unawaited(
              showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('This is a demo alert dialog.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
          child: const Text('Show Default Dialog'),
        ),
      ),
    );

@UseCase(
  name: 'Adaptive',
  type: AlertDialog,
  path: '[Theme Preview]/Dialog',
)
Widget adaptiveAlertDialog(BuildContext context) => Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            unawaited(
              showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog.adaptive(
                    title: const Text('AlertDialog Title'),
                    content: const Text(
                      'AlertDialog description',
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
          child: const Text('Show Adaptive Dialog'),
        ),
      ),
    );

@UseCase(
  name: 'DatePicker',
  type: DatePickerDialog,
  path: '[Theme Preview]/Dialog',
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

@UseCase(
  name: 'TimePicker',
  type: TimePickerDialog,
  path: '[Theme Preview]/Dialog',
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

@UseCase(
  name: 'DateRangePicker',
  type: DateRangePickerDialog,
  path: '[Theme Preview]/Dialog',
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
