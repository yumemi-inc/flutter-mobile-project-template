import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigationDebugPage extends ConsumerWidget {
  const NavigationDebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text('Debug Page'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RouteDropdownMenu(),
            ),
          ),
        ],
      ),
    );
  }
}

final class RouteDropdownMenu extends HookWidget {
  const RouteDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final routeBases = router.configuration.routes;
    final dropdownMenuEntries = useMemoized(
      () {
        final routes = routeBases.toRoutes();
        return routes
            .map(
              (route) {
                final routePath = route.path;

                // デバッグ関連のルートは除外する
                if (routePath.contains('debug')) {
                  return null;
                }
                return DropdownMenuEntry<_Route>(
                  value: route,
                  label: routePath,
                );
              },
            )
            .nonNulls
            .toList();
      },
      routeBases,
    );
    // DropdownMenu を親の横幅に合わせる
    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu<_Route>(
          width: constraints.maxWidth,
          dropdownMenuEntries: dropdownMenuEntries,
          // hintText: l.routeDropDownHintText,
          onSelected: (route) {
            if (route == null) {
              return;
            }
            router.go(route.path);
          },
        );
      },
    );
  }
}

extension _ToRoutes on List<RouteBase> {
  List<_Route> toRoutes([_Route? parentRoute]) {
    final routes = <_Route>[];
    for (final routeBase in this) {
      switch (routeBase) {
        case GoRoute():
          final route = _Route(
            goRoute: routeBase,
            parentRoute: parentRoute,
          );
          routes.add(route);

          final childRouteBases = routeBase.routes;
          if (childRouteBases.isNotEmpty) {
            routes.addAll(childRouteBases.toRoutes(route));
          }
        case ShellRoute() || StatefulShellRoute():
          routes.addAll(routeBase.routes.toRoutes());
      }
    }
    return routes;
  }
}

final class _Route {
  _Route({
    required GoRoute goRoute,
    _Route? parentRoute,
  })  : _goRoute = goRoute,
        _parentRoute = parentRoute;

  final GoRoute _goRoute;
  final _Route? _parentRoute;

  late final String path = _path;

  String get _path {
    final parentPath = _parentRoute?._path;
    final childPath = _goRoute.path;
    if (parentPath == null) {
      return childPath;
    }

    return '${parentPath == '/' ? '' : parentPath}/$childPath';
  }
}
