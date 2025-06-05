part of 'package:flutter_app/router/router.dart';

@TypedGoRoute<LoggerPageRoute>(
  path: LoggerPageRoute.path,
)
class LoggerPageRoute extends GoRouteData {
  const LoggerPageRoute();

  static const path = '/logger';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoggerPage();
  }
}
