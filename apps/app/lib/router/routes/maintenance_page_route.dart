part of 'package:flutter_app/router/router.dart';

@TypedGoRoute<MaintenancePageRoute>(
  path: MaintenancePageRoute.path,
)
class MaintenancePageRoute extends GoRouteData {
  const MaintenancePageRoute();

  static const path = '/maintenance';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage<Page<dynamic>>(
      child: MaintenancePage(),
    );
  }
}
