part of 'package:flutter_app/router/router.dart';

final class _DebugPageNavigatorImpl implements DebugPageNavigator {
  const _DebugPageNavigatorImpl();

  @override
  void goNavigationDebugPage(BuildContext context) {
    unawaited(
      const NavigationDebugPageRoute().push(context),
    );
  }

  @override
  void goTalkerPage(BuildContext context) {
    unawaited(
      const TalkerPageRoute().push(context),
    );
  }
}

final class _DebugPagePresenterImpl implements DebugPagePresenter {
  _DebugPagePresenterImpl(this.ref);

  final Ref ref;

  @override
  void enableForceUpdate() {
    ref.read(forceUpdateProvider.notifier).debugEnableForceUpdate();
  }
}

@TypedGoRoute<DebugPageRoute>(
  path: DebugPageRoute.path,
  routes: [
    TypedGoRoute<NavigationDebugPageRoute>(
      path: NavigationDebugPageRoute.path,
    ),
    TypedGoRoute<TalkerPageRoute>(
      path: TalkerPageRoute.path,
    ),
  ],
)
class DebugPageRoute extends GoRouteData {
  const DebugPageRoute();

  static const path = '/debug';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        debugPageNavigatorProvider.overrideWithValue(
          const _DebugPageNavigatorImpl(),
        ),
        debugPagePresenterProvider.overrideWith(
          _DebugPagePresenterImpl.new,
        ),
      ],
      child: const DebugPage(),
    );
  }
}

class NavigationDebugPageRoute extends GoRouteData {
  const NavigationDebugPageRoute();

  static const path = 'navigation_debug';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NavigationDebugPage();
  }
}

class TalkerPageRoute extends GoRouteData {
  const TalkerPageRoute();

  static const path = 'talker';

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TalkerPage();
  }
}
