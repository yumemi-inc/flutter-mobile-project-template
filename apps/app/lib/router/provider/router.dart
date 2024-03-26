import 'package:cores_core/app_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/router/routes/home_route.dart';
import 'package:flutter_app/router/routes/main_shell_route.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final maintenanceModeStatus = ref.watch(
    appStatusProvider.select((appStatus) => appStatus.maintenanceModeStatus),
  );
  return GoRouter(
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
