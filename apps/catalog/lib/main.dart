import 'package:catalog/main.directories.g.dart';
import 'package:cores_designsystem/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      // 下のAddonから順番にUseCaseを囲んでいく仕様になっている
      // 例えば、InspectorはDeviceFrameの中に表示される
      addons: [
        DeviceFrameAddon(
          initialDevice: Devices.ios.iPhone13,
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            Devices.ios.iPad,
            Devices.android.smallPhone.copyWith(
              name: 'small Android phone',
            ),
            Devices.android.mediumPhone.copyWith(
              name: 'medium Android phone',
            ),
            Devices.android.largeTablet.copyWith(
              name: 'large Android tablet',
            ),
          ],
        ),
        InspectorAddon(enabled: true),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: lightTheme()),
            WidgetbookTheme(name: 'Dark', data: darkTheme()),
          ],
        ),
        LocalizationAddon(
          locales: [
            const Locale('en', 'US'),
            const Locale('ja', 'JP'),
          ],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        BuilderAddon(
          name: 'Scaffold',
          builder: (context, child) {
            final scaffoldFinder = find.byType(Scaffold);
            return scaffoldFinder.hasFound
                ? child
                : Scaffold(
                    body: child,
                  );
          },
        ),
        BuilderAddon(
          name: 'SafeArea',
          builder: (context, child) => SafeArea(child: child),
        ),
        AlignmentAddon(),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
      ],
    );
  }
}
