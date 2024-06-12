part of 'package:flutter_app/router/provider/router.dart';

@TypedGoRoute<NavigationPageRoute>(
  path: NavigationPageRoute.path,
)
class NavigationPageRoute extends GoRouteData {
  const NavigationPageRoute();

  static const path = '/navigation';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        navigationNavigatorProvider.overrideWithValue(
          const NavigationNavigatorImpl(),
        ),
      ],
      child: const NavigationPage(),
    );
  }
}
