// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $markdownShellRoute,
    ];

RouteBase get $markdownShellRoute => ShellRouteData.$route(
      factory: $MarkdownShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $MarkdownPageRouteExtension._fromState,
        ),
      ],
    );

extension $MarkdownShellRouteExtension on MarkdownShellRoute {
  static MarkdownShellRoute _fromState(GoRouterState state) =>
      const MarkdownShellRoute();
}

extension $MarkdownPageRouteExtension on MarkdownPageRoute {
  static MarkdownPageRoute _fromState(GoRouterState state) => MarkdownPageRoute(
        key: state.uri.queryParameters['key'],
      );

  String get location => GoRouteData.$location(
        '/',
        queryParams: {
          if (key != null) 'key': key,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
