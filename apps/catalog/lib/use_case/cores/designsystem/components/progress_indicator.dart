import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// TargetPlartformで表示が変わるサンプル
@UseCase(name: 'CircularProgressIndicator', type: CircularProgressIndicator)
Widget circularProgressIndicator(BuildContext context) =>
    const CircularProgressIndicator.adaptive();
