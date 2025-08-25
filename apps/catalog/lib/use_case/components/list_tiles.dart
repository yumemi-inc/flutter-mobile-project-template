import 'package:flutter/widgets.dart';
import 'package:internal_design_ui/components.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'TextListTile', type: TextListTile)
Widget textListTile(BuildContext context) => TextListTile(
  onTap: () {},
  text: context.knobs.string(
    label: 'text',
    initialValue: 'text',
  ),
);
