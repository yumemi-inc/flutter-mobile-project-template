import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// CircularProgressIndicator
/// https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html

@UseCase(
  name: 'CircularProgressIndicator',
  type: CircularProgressIndicator,
  path: '[Theme Preview]/Communication/ProgressIndicator',
)
Widget circularProgressIndicator(BuildContext context) =>
    const CircularProgressIndicator();

/// TargetPlartformで表示が変わるサンプル
@UseCase(
  name: 'CircularProgressIndicatorAdaptive',
  type: CircularProgressIndicator,
  path: '[Theme Preview]/Communication/ProgressIndicator',
)
Widget circularProgressIndicatorAdaptive(BuildContext context) =>
    const CircularProgressIndicator.adaptive();

@UseCase(
  name: 'LinearProgressIndicator',
  type: LinearProgressIndicator,
  path: '[Theme Preview]/Communication/ProgressIndicator',
)
Widget linearProgressIndicator(BuildContext context) =>
    const LinearProgressIndicator();
