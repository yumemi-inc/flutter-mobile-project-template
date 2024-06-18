import 'package:cores_navigation/providers.dart';
import 'package:features_debug_mode/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/provider/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigationPage extends ConsumerWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // GoRoute returnGoRoute(RouteBase route) {
    //   print('jikkou');
    //   if (route is StatefulShellRoute) {
    //     print('route is statefulshelroute');
    //     late GoRoute routeFromStatefulShellRoute;
    //
    //     route.routes.forEach((subRoute) {
    //       print('subroute-------------$subRoute');
    //       routeFromStatefulShellRoute = subRoute as GoRoute;
    //     });
    //     //多分ここはforEach回ってるだけで、二回目のsubrouteしかreturnされていないんだと思う
    //     return routeFromStatefulShellRoute;
    //   } else {
    //     return route as GoRoute;
    //   }
    // }

    GoRoute returnGoRoute(RouteBase route) {
      if (route is StatefulShellRoute) {
        print('route is statefulshelroute');

        for (final subRoute in route.routes) {
            if (subRoute is GoRoute) {
              return subRoute;
            }
        }

        // 万が一GoRouteが見つからなかった場合に備えて例外を発生させる
        throw Exception('No GoRoute found in StatefulShellRoute');
      } else if (route is GoRoute) {
        return route;
      } else {
        // ここでも例外を発生させる
        throw Exception('Invalid RouteBase: No GoRoute found');
      }
    }

    final l10n = L10nDebug.of(context);
    final goRoutes =
        ref.watch(routerProvider).configuration.routes.toGoRoutes();
    print('goRoutes----------------$goRoutes');
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navigationPageAppBar),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: ref.watch(routerProvider).configuration.routes.map((e) {
              final route = returnGoRoute(e);
              print(route);
              return _Route(
                routes: [route],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _Route extends StatelessWidget {
  const _Route({
    required List<GoRoute> routes,
    List<GoRoute> parent = const [],
  })  : _routes = routes,
        _parent = parent;

  final List<GoRoute> _routes;
  final List<GoRoute> _parent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _routes.map(
        (route) {
          // print(route.routes.isNotEmpty);
          print('route--------$route');
          if (route.routes.isNotEmpty) {
            return _Route(
              routes: route.routes.cast<GoRoute>(),
              parent: [..._parent, route],
            );
          }
          return _FixSizedElevatedButton(
            title: [..._parent, route].map((e) => e.path).join('/'),
            onPressed: () async => context.push(
              [..._parent, route].map((e) => e.path).join('/'),
            ),
          );
        },
      ).toList(),
    );
  }
}

extension _ToGoRoutes on List<RouteBase> {
  List<GoRoute> toGoRoutes() {
    final goRoutes = <GoRoute>[];
    for (final route in this) {
      switch (route) {
        case GoRoute():
          final childRoutes = route.routes;
          if (childRoutes.isEmpty) {
            goRoutes.add(route);
          } else {
            goRoutes.addAll(childRoutes.toGoRoutes());
          }
        case ShellRoute() || StatefulShellRoute():
          goRoutes.addAll(route.routes.toGoRoutes());
      }
    }
    return goRoutes;
  }
}

class _FixSizedElevatedButton extends StatelessWidget {
  const _FixSizedElevatedButton({
    required String title,
    required VoidCallback onPressed,
  })  : _title = title,
        _onPressed = onPressed;

  final String _title;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Text(_title),
      ),
    );
  }
}
