import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;

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
                // デバッグ関連のルートは除外する
                if (route.path.contains('debug')) {
                  return null;
                }
                return DropdownMenuEntry<_Route>(
                  value: route,
                  label: route.label,
                );
              },
            )
            .nonNulls
            .toList();
      },
      routeBases,
    );
    final pathEditController = useTextEditingController();

    // DropdownMenu を親の横幅に合わせる
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return DropdownMenu<_Route>(
              width: constraints.maxWidth,
              dropdownMenuEntries: dropdownMenuEntries,
              // hintText: l.routeDropDownHintText,
              onSelected: (selectedRoute) {
                if (selectedRoute == null) {
                  return;
                }
                pathEditController.text = selectedRoute.path;
              },
            );
          },
        ),
        const SizedBox.square(dimension: 16),
        TextField(
          controller: pathEditController,
          decoration: const InputDecoration(label: Text('Path')),
          maxLines: 2,
        ),
        const SizedBox.square(dimension: 16),
        ElevatedButton(
          onPressed: () {
            final path = pathEditController.text;
            router.go(path);
          },
          child: const Text('Go'),
        ),
      ],
    );
  }
}

extension _ToRoutes on List<RouteBase> {
  List<_Route> toRoutes([_Route? parentRoute]) {
    final routes = <_Route>[];
    for (final routeBase in this) {
      switch (routeBase) {
        case GoRoute():
          var routePath = routeBase.path;
          if (parentRoute != null) {
            routePath = p.join(parentRoute.path, routePath);
          }

          final route = _Route(
            label: routeBase.path,
            path: routePath,
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
    required this.label,
    required this.path,
  });

  final String label;
  final String path;
}
