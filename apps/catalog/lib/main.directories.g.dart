// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:catalog/use_case/cores/designsystem/components/list_tiles.dart'
    as _i32;
import 'package:catalog/use_case/cores/designsystem/theme/actions/common_buttons.dart'
    as _i2;
import 'package:catalog/use_case/cores/designsystem/theme/actions/floating_action_button.dart'
    as _i3;
import 'package:catalog/use_case/cores/designsystem/theme/actions/icon_button.dart'
    as _i4;
import 'package:catalog/use_case/cores/designsystem/theme/actions/segmented_button.dart'
    as _i5;
import 'package:catalog/use_case/cores/designsystem/theme/communication/badge.dart'
    as _i6;
import 'package:catalog/use_case/cores/designsystem/theme/communication/progress_indicator.dart'
    as _i7;
import 'package:catalog/use_case/cores/designsystem/theme/communication/snack_bar.dart'
    as _i8;
import 'package:catalog/use_case/cores/designsystem/theme/containment/alert_dialog.dart'
    as _i9;
import 'package:catalog/use_case/cores/designsystem/theme/containment/bottom_sheet.dart'
    as _i10;
import 'package:catalog/use_case/cores/designsystem/theme/containment/card.dart'
    as _i11;
import 'package:catalog/use_case/cores/designsystem/theme/containment/divider.dart'
    as _i12;
import 'package:catalog/use_case/cores/designsystem/theme/containment/list_tile.dart'
    as _i13;
import 'package:catalog/use_case/cores/designsystem/theme/navigation/app_bar.dart'
    as _i14;
import 'package:catalog/use_case/cores/designsystem/theme/navigation/bottom_app_bar.dart'
    as _i15;
import 'package:catalog/use_case/cores/designsystem/theme/navigation/navigation_bar.dart'
    as _i16;
import 'package:catalog/use_case/cores/designsystem/theme/navigation/navigation_drawer.dart'
    as _i17;
import 'package:catalog/use_case/cores/designsystem/theme/navigation/navigation_rail.dart'
    as _i18;
import 'package:catalog/use_case/cores/designsystem/theme/navigation/tab_bar.dart'
    as _i19;
import 'package:catalog/use_case/cores/designsystem/theme/selection/check_box.dart'
    as _i20;
import 'package:catalog/use_case/cores/designsystem/theme/selection/chip.dart'
    as _i21;
import 'package:catalog/use_case/cores/designsystem/theme/selection/date_picker.dart'
    as _i22;
import 'package:catalog/use_case/cores/designsystem/theme/selection/date_range_picker.dart'
    as _i23;
import 'package:catalog/use_case/cores/designsystem/theme/selection/menu.dart'
    as _i24;
import 'package:catalog/use_case/cores/designsystem/theme/selection/radio.dart'
    as _i25;
import 'package:catalog/use_case/cores/designsystem/theme/selection/slider.dart'
    as _i26;
import 'package:catalog/use_case/cores/designsystem/theme/selection/switch.dart'
    as _i27;
import 'package:catalog/use_case/cores/designsystem/theme/selection/time_picker.dart'
    as _i28;
import 'package:catalog/use_case/cores/designsystem/theme/style/color_scheme.dart'
    as _i29;
import 'package:catalog/use_case/cores/designsystem/theme/style/typography.dart'
    as _i30;
import 'package:catalog/use_case/cores/designsystem/theme/text_inputs/text_field.dart'
    as _i31;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'Theme Preview',
    children: [
      _i1.WidgetbookFolder(
        name: 'Actions',
        children: [
          _i1.WidgetbookFolder(
            name: 'Common',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ElevatedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'ElevatedButton',
                  builder: _i2.elevatedButton,
                ),
              ),
              _i1.WidgetbookComponent(
                name: 'FilledButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Default',
                    builder: _i2.filledButton,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Tonal',
                    builder: _i2.filledTonalButton,
                  ),
                ],
              ),
              _i1.WidgetbookLeafComponent(
                name: 'OutlinedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'OutlinedButton',
                  builder: _i2.outlinedButton,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'TextButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'TextButton',
                  builder: _i2.textButton,
                ),
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'FloatingActionButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'FloatingActionButton',
              builder: _i3.floatingActionButton,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'IconButton',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i4.iconButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'Filled',
                builder: _i4.filledIconButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'Outlined',
                builder: _i4.outlinedIconButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'Tonal',
                builder: _i4.filledTonalIconButton,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'SegmentedButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'SegmentedButton',
              builder: _i5.segmentedButton,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Communication',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Badge',
            useCase: _i1.WidgetbookUseCase(
              name: 'Badge',
              builder: _i6.badge,
            ),
          ),
          _i1.WidgetbookFolder(
            name: 'ProgressIndicator',
            children: [
              _i1.WidgetbookComponent(
                name: 'CircularProgressIndicator',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'CircularProgressIndicator',
                    builder: _i7.circularProgressIndicator,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'CircularProgressIndicatorAdaptive',
                    builder: _i7.circularProgressIndicatorAdaptive,
                  ),
                ],
              ),
              _i1.WidgetbookLeafComponent(
                name: 'LinearProgressIndicator',
                useCase: _i1.WidgetbookUseCase(
                  name: 'LinearProgressIndicator',
                  builder: _i7.linearProgressIndicator,
                ),
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'SnackBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'SnackBar',
              builder: _i8.snackBar,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Containment',
        children: [
          _i1.WidgetbookComponent(
            name: 'AlertDialog',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Adaptive',
                builder: _i9.adaptiveAlertDialog,
              ),
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i9.alertDialog,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BottomSheet',
            useCase: _i1.WidgetbookUseCase(
              name: 'BottomSheet',
              builder: _i10.bottomSheet,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'Card',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Elevated',
                builder: _i11.elevatedCard,
              ),
              _i1.WidgetbookUseCase(
                name: 'Filled',
                builder: _i11.filledCard,
              ),
              _i1.WidgetbookUseCase(
                name: 'Outlined',
                builder: _i11.outlinedCard,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'Divider',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i12.divider,
              ),
              _i1.WidgetbookUseCase(
                name: 'Vertical',
                builder: _i12.verticalDivider,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'ListTile',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i13.defaultListTile,
              ),
              _i1.WidgetbookUseCase(
                name: 'Divider',
                builder: _i13.separatedListTile,
              ),
            ],
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Navigation',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'AppBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i14.appBar,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BottomAppBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'BottomAppBar',
              builder: _i15.bottomAppBar,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'NavigationBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'NavigationBar',
              builder: _i16.navigationBar,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'NavigationDrawer',
            useCase: _i1.WidgetbookUseCase(
              name: 'NavigationDrawer',
              builder: _i17.navigationDrawer,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'NavigationRail',
            useCase: _i1.WidgetbookUseCase(
              name: 'NavigationRail',
              builder: _i18.navigationRail,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'TabBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'TabBar',
              builder: _i19.tabBar,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Selection',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Checkbox',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i20.checkbox,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Chip',
            useCase: _i1.WidgetbookUseCase(
              name: 'Chip',
              builder: _i21.chip,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'DatePickerDialog',
            useCase: _i1.WidgetbookUseCase(
              name: 'DatePicker',
              builder: _i22.datePicker,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'DateRangePickerDialog',
            useCase: _i1.WidgetbookUseCase(
              name: 'DateRangePicker',
              builder: _i23.dateRangePicker,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'MenuAnchor',
            useCase: _i1.WidgetbookUseCase(
              name: 'Menu',
              builder: _i24.menu,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Radio',
            useCase: _i1.WidgetbookUseCase(
              name: 'Radio',
              builder: _i25.radio,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Slider',
            useCase: _i1.WidgetbookUseCase(
              name: 'Slider',
              builder: _i26.slider,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'Switch',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Adaptive',
                builder: _i27.adaptiveSwitch,
              ),
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i27.defaultSwitch,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'TimePickerDialog',
            useCase: _i1.WidgetbookUseCase(
              name: 'TimePicker',
              builder: _i28.timePicker,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Style',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ColorScheme',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i29.buildThemeColorSchemeUseCase,
              designLink: 'https://m3.material.io/styles/color/overview',
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'TextTheme',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i30.buildThemeTypographyUseCase,
              designLink: 'https://m3.material.io/styles/typography/overview',
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'TextInputs',
        children: [
          _i1.WidgetbookComponent(
            name: 'TextField',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i31.textField,
              ),
              _i1.WidgetbookUseCase(
                name: 'Outline',
                builder: _i31.outlinedTextField,
              ),
            ],
          )
        ],
      ),
    ],
  ),
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
              builder: _i32.textListTile,
            ),
          )
        ],
      )
    ],
  ),
];
