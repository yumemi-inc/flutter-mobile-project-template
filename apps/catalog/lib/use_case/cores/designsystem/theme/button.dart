import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'ElevatedButton',
  type: ElevatedButton,
  path: '[Theme Preview]/Button',
)
Widget elevatedButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated'),
          ),
          const SizedBox(height: 16),
          const ElevatedButton(
            onPressed: null,
            child: Text('Elevated'),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Default',
  type: FilledButton,
  path: '[Theme Preview]/Button',
)
Widget filledButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton(
            onPressed: () {},
            child: const Text('Filled'),
          ),
          const SizedBox(height: 16),
          const FilledButton(
            onPressed: null,
            child: Text('Filled'),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Tonal',
  type: FilledButton,
  path: '[Theme Preview]/Button',
)
Widget filledTonalButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Filled Tonal'),
          ),
          const SizedBox(height: 16),
          const FilledButton.tonal(
            onPressed: null,
            child: Text('Filled Tonal'),
          ),
        ],
      ),
    );

@UseCase(
  name: 'OutlinedButton',
  type: OutlinedButton,
  path: '[Theme Preview]/Button',
)
Widget outlinedButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined'),
          ),
          const SizedBox(height: 16),
          const OutlinedButton(
            onPressed: null,
            child: Text('Outlined'),
          ),
        ],
      ),
    );

@UseCase(
  name: 'TextButton',
  type: TextButton,
  path: '[Theme Preview]/Button',
)
Widget textButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Text'),
          ),
          const SizedBox(height: 16),
          const TextButton(
            onPressed: null,
            child: Text('Text'),
          ),
        ],
      ),
    );

@UseCase(
  name: 'FloatingActionButton',
  type: FloatingActionButton,
  path: '[Theme Preview]/Button',
)
Widget floatingActionButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.large(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Create'),
          ),
          const SizedBox(height: 16),
          const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Default',
  type: IconButton,
  path: '[Theme Preview]/Button',
)
Widget iconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Filled',
  type: IconButton,
  path: '[Theme Preview]/Button',
)
Widget filledIconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton.filled(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Tonal',
  type: IconButton,
  path: '[Theme Preview]/Button',
)
Widget filledTonalIconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton.filledTonal(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

@UseCase(
  name: 'Outlined',
  type: IconButton,
  path: '[Theme Preview]/Button',
)
Widget outlinedIconButton(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(height: 16),
          const IconButton.outlined(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );

enum _Calendar { day, week, month, year }

@UseCase(
  name: 'SegmentedButton',
  type: SegmentedButton,
  path: '[Theme Preview]/Button',
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
