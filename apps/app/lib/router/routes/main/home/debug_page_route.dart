part of 'package:flutter_app/router/router.dart';

final class _DebugPageNavigatorImpl implements DebugPageNavigator {
  const _DebugPageNavigatorImpl();

  @override
  void goNavigationDebugPage(BuildContext context) {
    unawaited(
      const NavigationDebugPageRoute().push(context),
    );
  }

  @override
  void goLoggerPage(BuildContext context) {
    unawaited(
      const LoggerPageRoute().push(context),
    );
  }
}

@TypedGoRoute<DebugPageRoute>(
  path: DebugPageRoute.path,
  routes: [
    TypedGoRoute<NavigationDebugPageRoute>(
      path: NavigationDebugPageRoute.path,
    ),
    TypedGoRoute<LoggerPageRoute>(
      path: LoggerPageRoute.path,
    ),
  ],
)
class DebugPageRoute extends GoRouteData {
  const DebugPageRoute();

  static const path = '/debug';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        debugPageNavigatorProvider.overrideWithValue(
          const _DebugPageNavigatorImpl(),
        ),
      ],
      child: const DebugPage(),
    );
  }
}

class NavigationDebugPageRoute extends GoRouteData {
  const NavigationDebugPageRoute();

  static const path = 'navigation_debug';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NavigationDebugPage();
  }
}

class LoggerPageRoute extends GoRouteData {
  const LoggerPageRoute();

  static const path = 'logger';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoggerPage();
  }
}
