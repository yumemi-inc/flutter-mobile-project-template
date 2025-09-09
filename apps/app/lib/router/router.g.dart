// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore, deprecated_member_use

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $debugPageRoute,
  $mainPageShellRoute,
  $maintenancePageRoute,
];

RouteBase get $debugPageRoute => GoRouteData.$route(
  path: '/debug',

  parentNavigatorKey: DebugPageRoute.$parentNavigatorKey,

  factory: _$DebugPageRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'navigation_debug',

      parentNavigatorKey: NavigationDebugPageRoute.$parentNavigatorKey,

      factory: _$NavigationDebugPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'talker',

      parentNavigatorKey: TalkerPageRoute.$parentNavigatorKey,

      factory: _$TalkerPageRoute._fromState,
    ),
  ],
);

mixin _$DebugPageRoute on GoRouteData {
  static DebugPageRoute _fromState(GoRouterState state) =>
      const DebugPageRoute();

  @override
  String get location => GoRouteData.$location('/debug');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$NavigationDebugPageRoute on GoRouteData {
  static NavigationDebugPageRoute _fromState(GoRouterState state) =>
      const NavigationDebugPageRoute();

  @override
  String get location => GoRouteData.$location('/debug/navigation_debug');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TalkerPageRoute on GoRouteData {
  static TalkerPageRoute _fromState(GoRouterState state) =>
      const TalkerPageRoute();

  @override
  String get location => GoRouteData.$location('/debug/talker');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainPageShellRoute => StatefulShellRouteData.$route(
  factory: $MainPageShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/', factory: _$HomePageRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/setting',

          factory: _$SettingPageRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'license',

              factory: _$LicensePageRoute._fromState,
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

mixin _$HomePageRoute on GoRouteData {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingPageRoute on GoRouteData {
  static SettingPageRoute _fromState(GoRouterState state) =>
      const SettingPageRoute();

  @override
  String get location => GoRouteData.$location('/setting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LicensePageRoute on GoRouteData {
  static LicensePageRoute _fromState(GoRouterState state) =>
      const LicensePageRoute();

  @override
  String get location => GoRouteData.$location('/setting/license');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $maintenancePageRoute => GoRouteData.$route(
  path: '/maintenance',

  factory: _$MaintenancePageRoute._fromState,
);

mixin _$MaintenancePageRoute on GoRouteData {
  static MaintenancePageRoute _fromState(GoRouterState state) =>
      const MaintenancePageRoute();

  @override
  String get location => GoRouteData.$location('/maintenance');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'7f2c119c1ed13737bc4e35a5527ceed85f06309a';

/// See also [router].
@ProviderFor(router)
final routerProvider = Provider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
