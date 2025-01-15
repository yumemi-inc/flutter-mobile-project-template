import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'CircularProgressIndicator',
  type: CircularProgressIndicator,
  path: '[Theme Preview]/ProgressIndicator',
)
Widget circularProgressIndicator(BuildContext context) =>
    const CircularProgressIndicator();

/// TargetPlartformで表示が変わるサンプル
@UseCase(
  name: 'CircularProgressIndicatorAdaptive',
  type: CircularProgressIndicator,
  path: '[Theme Preview]/ProgressIndicator',
)
Widget circularProgressIndicatorAdaptive(BuildContext context) =>
    const CircularProgressIndicator.adaptive();

@UseCase(
  name: 'LinearProgressIndicator',
  type: LinearProgressIndicator,
  path: '[Theme Preview]/ProgressIndicator',
)
Widget linearProgressIndicator(BuildContext context) =>
    const LinearProgressIndicator();
