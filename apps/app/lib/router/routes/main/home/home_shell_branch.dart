part of 'package:flutter_app/router/provider/router.dart';

const homeShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: HomePageRoute.path,
      routes: [
        TypedGoRoute<GithubRepositoryDetailPageRoute>(
          path: GithubRepositoryDetailPageRoute.path,
        ),
        TypedGoRoute<DebugPageRoute>(
          path: DebugPageRoute.path,
        ),
        TypedGoRoute<WebPageRoute>(
          path: WebPageRoute.path,
        ),
      ],
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
      child: ProviderScope(
        overrides: [
          homeNavigatorProvider.overrideWithValue(const HomeNavigatorImpl()),
        ],
        child: const HomePage(),
      ),
    );
  }
}

class GithubRepositoryDetailPageRoute extends GoRouteData {
  const GithubRepositoryDetailPageRoute(this.repositoryName);

  final String repositoryName;

  static const path = 'github_repository_detail';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GithubRepositoryDetailPage(repositoryName: repositoryName);
  }
}
