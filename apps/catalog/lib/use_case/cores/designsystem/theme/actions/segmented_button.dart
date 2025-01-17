import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// SegmentedButton
/// https://api.flutter.dev/flutter/material/SegmentedButton-class.html

enum _Calendar { day, week, month, year }

@UseCase(
  name: 'SegmentedButton',
  type: SegmentedButton,
  path: '[Theme Preview]/Actions',
)
Widget segmentedButton(BuildContext context) {
  var calendarView = _Calendar.month;
  return Scaffold(
    body: Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          return SegmentedButton<_Calendar>(
            segments: const <ButtonSegment<_Calendar>>[
              ButtonSegment<_Calendar>(
                value: _Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
              ),
              ButtonSegment<_Calendar>(
                value: _Calendar.week,
                label: Text('Week'),
                icon: Icon(Icons.calendar_view_week),
              ),
              ButtonSegment<_Calendar>(
                value: _Calendar.month,
                label: Text('Month'),
                icon: Icon(Icons.calendar_view_month),
              ),
              ButtonSegment<_Calendar>(
                value: _Calendar.year,
                label: Text('Year'),
                icon: Icon(Icons.calendar_today),
              ),
            ],
            selected: <_Calendar>{calendarView},
            onSelectionChanged: (newSelection) {
              setState(() => calendarView = newSelection.first);
            },
          );
        },
      ),
    ),
  );
}
