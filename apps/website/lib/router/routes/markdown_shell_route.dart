part of 'package:website/router/router.dart';

@TypedShellRoute<MarkdownShellRoute>(
  routes: [
    TypedGoRoute<MarkdownPageRoute>(path: MarkdownPageRoute.path),
  ],
)
class MarkdownShellRoute extends ShellRouteData {
  const MarkdownShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return DefaultLayout(child: navigator);
  }
}
