import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Slider
/// https://api.flutter.dev/flutter/material/Slider-class.html

@UseCase(
  name: 'Slider',
  type: Slider,
  path: '[Theme Preview]/Selection',
)
Widget slider(BuildContext context) {
  var value1 = 30.0;
  return Scaffold(
    body: Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                max: 100,
                value: value1,
                onChanged: (newValue) {
                  setState(() => value1 = newValue);
                },
              ),
              const SizedBox(height: 16),
              const Slider(
                max: 100,
                value: 30,
                onChanged: null,
              ),
            ],
          );
        },
      ),
    ),
  );
}
