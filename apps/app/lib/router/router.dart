import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_app/presentation/providers/force_update_policy_notifier_provider.dart';
import 'package:flutter_app/presentation/providers/maintenance_policy_notifier_provider.dart';
import 'package:flutter_app/presentation/ui/home_page.dart';
import 'package:flutter_app/presentation/ui/operational_settings/maintenance_page.dart';
import 'package:flutter_app/presentation/ui/setting/setting_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:internal_debug/ui.dart';
import 'package:internal_design_ui/common_assets.dart';
import 'package:internal_domain_model/operational_settings/operational_settings.dart';
import 'package:internal_util_ui/custom_app_lifecycle_listener.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package:flutter_app/router/routes/main/home/debug_page_route.dart';
part 'package:flutter_app/router/routes/main/home/home_shell_branch.dart';
part 'package:flutter_app/router/routes/main/main_page_shell_route.dart';
part 'package:flutter_app/router/routes/main/setting/setting_shell_branch.dart';
part 'package:flutter_app/router/routes/maintenance_page_route.dart';
part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final isMaintenanceModeEnabled = ref.watch(
    maintenancePolicyNotifierProvider.select(
      (state) => state.valueOrNull is MaintenanceEnabled,
    ),
  );
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      ...$appRoutes.where((route) {
        if (route is GoRoute) {
          return route.path != DebugPageRoute.path;
        }

        return true;
      }),
      if (kDebugMode) $debugPageRoute,
    ],
    debugLogDiagnostics: kDebugMode,
    initialLocation: HomePageRoute.path,
    redirect: (_, _) {
      if (isMaintenanceModeEnabled) {
        return MaintenancePageRoute.path;
      }
      return null;
    },
  );
}
