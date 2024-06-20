part of 'package:flutter_app/router/provider/router.dart';

final class _DebugPageNavigatorImpl implements DebugPageNavigator {
  const _DebugPageNavigatorImpl();

  @override
  void goNavigationDebugPage(BuildContext context) {
    const NavigationDebugPageRoute().go(context);
  }
}

class DebugPageRoute extends GoRouteData {
  const DebugPageRoute();

  static const path = 'debug';

  static final $parentNavigatorKey = _rootNavigatorKey;

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

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NavigationDebugPage();
  }
}
