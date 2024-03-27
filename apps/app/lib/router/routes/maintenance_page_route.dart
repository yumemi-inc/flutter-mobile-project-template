part of 'package:flutter_app/router/provider/router.dart';

@TypedGoRoute<MaintenancePageRoute>(
  path: MaintenancePageRoute.path,
)
class MaintenancePageRoute extends GoRouteData {
  const MaintenancePageRoute();

  static const path = '/maintenance';

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage<Page<dynamic>>(
      child: MaintenancePage(),
    );
  }
}
