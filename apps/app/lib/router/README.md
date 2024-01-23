### Policy
To avoid circular references, detailed implementation of screen transitions is defined in routes/.

Each feature screen receives a screen transition function (callback) as an argument and executes it to perform the screen transition.

In this way, the dependency direction is as shown in ↓

`app -> feature`

If routes are listed in a single file, the file may become bloated.

Therefore, route files should be placed appropriately under routes for each project.
```
└── router
    ├── routes
    │   ├── page_1_route.dart
    │   └── page_2_route.dart
    └── provider
        ├── router.dart
        └── router.g.dart
```

ex. Contents of the route definition file

```dart
@TypedGoRoute<HomePageRoute>(
    path: HomePageRoute.path,
    routes: [
      TypedGoRoute<SettingRoute>(
        path: SettingRoute.path,
      )
    ]
)

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage(
      goSettingPage: SettingRoute().go(context);
    );
  }
}

class SettingRoute extends GoRouteData {
  const SettingRoute();

  static const path = 'setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingPage();
  }
}
```

ex. A feature file that executes the received callback and performs screen transitions
```dart
class HomePage extends ConsumerWidget {
  const HomePage({
    required VoidCallback goSettingPage,
    super.key,
  }) : _goSettingPage = goSettingPage;

  final VoidCallback _goSettingPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          IconButton(
            onPressed: _goSettingPage, // exec callback
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: // omit
    );
  }
}
```
