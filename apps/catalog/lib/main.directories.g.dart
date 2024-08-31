// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:catalog/use_case/cores/designsystem/components/list_tiles.dart'
    as _i2;
import 'package:catalog/use_case/cores/designsystem/components/progress_indicator.dart'
    as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'list_tiles',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'TextListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'TextListTile',
              builder: _i2.textListTile,
            ),
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'material',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'CircularProgressIndicator',
        useCase: _i1.WidgetbookUseCase(
          name: 'CircularProgressIndicator',
          builder: _i3.circularProgressIndicator,
        ),
      )
    ],
  ),
];
