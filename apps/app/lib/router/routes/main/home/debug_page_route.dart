part of 'package:flutter_app/router/provider/router.dart';

class DebugPageRoute extends GoRouteData {
  const DebugPageRoute();

  static const path = 'debug';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        debugNavigatorProvider.overrideWithValue(const DebugNavigatorImpl()),
      ],
      child: const DebugPage(),
    );
  }
}

class NavigationPageRoute extends GoRouteData {
  const NavigationPageRoute();

  static const path = 'navigation';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NavigationPage();
  }
}
