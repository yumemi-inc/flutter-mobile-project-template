import 'package:cores_navigation/providers.dart';
import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/routes/home_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(homeNavigatorProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () => navigator.goDebugModePage(context),
            icon: const Icon(
              Icons.construction,
            ),
          ),
          IconButton(
            onPressed: () => navigator.goSettingPage(context),
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: const GitHubRepositoryList(),
    );
  }
}

final homeNavigatorProvider = Provider(
  (_) => const HomeNavigatorImpl(),
);

final class HomeNavigatorImpl implements HomeNavigator {
  const HomeNavigatorImpl();

  @override
  void goDebugModePage(BuildContext context) {
    const DebugModePageRoute().go(context);
  }

  @override
  void goSettingPage(BuildContext context) {
    const SettingPageRoute().go(context);
  }
}
