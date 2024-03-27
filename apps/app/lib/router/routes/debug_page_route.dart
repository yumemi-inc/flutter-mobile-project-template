part of 'package:flutter_app/router/provider/router.dart';

@TypedGoRoute<DebugPageRoute>(
  path: DebugPageRoute.path,
)
class DebugPageRoute extends GoRouteData {
  const DebugPageRoute();

  static const path = '/debug';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DebugPage();
  }
}
