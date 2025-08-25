import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Switch
/// https://api.flutter.dev/flutter/material/Switch-class.html

@UseCase(
  name: 'Default',
  type: Switch,
  path: '[Theme Preview]/Selection',
)
Widget defaultSwitch(BuildContext context) {
  var value = false;
  return Scaffold(
    body: Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: value,
                onChanged: (newValue) {
                  setState(() => value = newValue);
                },
              ),
              const SizedBox(height: 16),
              const Switch(
                value: false,
                onChanged: null,
              ),
              const SizedBox(height: 16),
              Switch(
                value: value,
                thumbIcon: const WidgetStateProperty<Icon>.fromMap(
                  <WidgetStatesConstraint, Icon>{
                    WidgetState.selected: Icon(Icons.check),
                    WidgetState.any: Icon(Icons.close),
                  },
                ),
                onChanged: (newValue) {
                  setState(() => value = newValue);
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}

@UseCase(
  name: 'Adaptive',
  type: Switch,
  path: '[Theme Preview]/Selection',
)
Widget adaptiveSwitch(BuildContext context) {
  var value = false;
  return Scaffold(
    body: Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch.adaptive(
                value: value,
                onChanged: (newValue) {
                  setState(() => value = newValue);
                },
              ),
              const SizedBox(height: 16),
              const Switch.adaptive(
                value: false,
                onChanged: null,
              ),
              const SizedBox(height: 16),
              Switch.adaptive(
                value: value,
                thumbIcon: const WidgetStateProperty<Icon>.fromMap(
                  <WidgetStatesConstraint, Icon>{
                    WidgetState.selected: Icon(Icons.check),
                    WidgetState.any: Icon(Icons.close),
                  },
                ),
                onChanged: (newValue) {
                  setState(() => value = newValue);
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
