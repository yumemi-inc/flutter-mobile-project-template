// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainPageShellRoute,
      $maintenancePageRoute,
    ];

RouteBase get $mainPageShellRoute => StatefulShellRouteData.$route(
      factory: $MainPageShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $HomePageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'github_repository_detail',
                  factory: $GithubRepositoryDetailPageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'debug',
                  parentNavigatorKey: DebugPageRoute.$parentNavigatorKey,
                  factory: $DebugPageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'web',
                  parentNavigatorKey: WebPageRoute.$parentNavigatorKey,
                  factory: $WebPageRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/setting',
              factory: $SettingPageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'license',
                  factory: $LicensePageRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MainPageShellRouteExtension on MainPageShellRoute {
  static MainPageShellRoute _fromState(GoRouterState state) =>
      const MainPageShellRoute();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GithubRepositoryDetailPageRouteExtension
    on GithubRepositoryDetailPageRoute {
  static GithubRepositoryDetailPageRoute _fromState(GoRouterState state) =>
      GithubRepositoryDetailPageRoute(
        state.uri.queryParameters['repository-name']!,
      );

  String get location => GoRouteData.$location(
        '/github_repository_detail',
        queryParams: {
          'repository-name': repositoryName,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DebugPageRouteExtension on DebugPageRoute {
  static DebugPageRoute _fromState(GoRouterState state) =>
      const DebugPageRoute();

  String get location => GoRouteData.$location(
        '/debug',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WebPageRouteExtension on WebPageRoute {
  static WebPageRoute _fromState(GoRouterState state) => const WebPageRoute();

  String get location => GoRouteData.$location(
        '/web',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingPageRouteExtension on SettingPageRoute {
  static SettingPageRoute _fromState(GoRouterState state) =>
      const SettingPageRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LicensePageRouteExtension on LicensePageRoute {
  static LicensePageRoute _fromState(GoRouterState state) =>
      const LicensePageRoute();

  String get location => GoRouteData.$location(
        '/setting/license',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $maintenancePageRoute => GoRouteData.$route(
      path: '/maintenance',
      factory: $MaintenancePageRouteExtension._fromState,
    );

extension $MaintenancePageRouteExtension on MaintenancePageRoute {
  static MaintenancePageRoute _fromState(GoRouterState state) =>
      const MaintenancePageRoute();

  String get location => GoRouteData.$location(
        '/maintenance',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'd280eca8c92770f9cc2f7077be3fd7543b19be7c';

/// See also [router].
@ProviderFor(router)
final routerProvider = Provider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
