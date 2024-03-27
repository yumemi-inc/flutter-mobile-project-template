import 'package:cores_core/app_status.dart';
import 'package:cores_core/util.dart';
import 'package:cores_navigation/providers.dart';
import 'package:features_debug_mode/ui.dart';
import 'package:features_github_repository/ui.dart';
import 'package:features_setting/setting.dart';
import 'package:features_webview/webview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/home/ui/home_page.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_app/router/navigator/home_navigator.dart';
import 'package:flutter_app/router/navigator/setting_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package:flutter_app/router/routes/main/home/home_shell_branch.dart';
part 'package:flutter_app/router/routes/main/setting/setting_shell_branch.dart';
part 'package:flutter_app/router/routes/main/main_page_shell_route.dart';
part 'package:flutter_app/router/routes/maintenance_page_route.dart';
part 'package:flutter_app/router/routes/main/home/web_page_route.dart';
part 'package:flutter_app/router/routes/main/home/debug_page_route.dart';
part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final maintenanceModeStatus = ref.watch(
    appStatusProvider.select((appStatus) => appStatus.maintenanceModeStatus),
  );
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: $appRoutes,
    debugLogDiagnostics: kDebugMode,
    initialLocation: HomePageRoute.path,
    redirect: (_, __) {
      final maintenanceModeEnabled = maintenanceModeStatus.enabled;

      if (maintenanceModeEnabled) {
        return MaintenancePageRoute.path;
      }
      return null;
    },
  );
}
