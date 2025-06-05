part of 'package:flutter_app/router/router.dart';

const homeShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: HomePageRoute.path,
    ),
  ],
);

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomAppLifecycleListener(
      onResume: () {
        // Example: Obtain the latest AppStatus and update if needed.
      },
      // By overriding the Provider in the Route build method, it is possible to
      // switch the implementation of Navigator based on the source of
      // navigation or the state.
      child: kDebugMode
          ? ShakeDetectionWidget(
              onShake: () {
                if (!context.mounted) {
                  return;
                }

                final isDebugRoute = GoRouter.of(
                  context,
                ).state.uri.path.contains(DebugPageRoute.path);

                if (!isDebugRoute) {
                  unawaited(const DebugPageRoute().push(context));
                }
              },
              child: const ProviderScope(child: HomePage()),
            )
          : const ProviderScope(child: HomePage()),
    );
  }
}
