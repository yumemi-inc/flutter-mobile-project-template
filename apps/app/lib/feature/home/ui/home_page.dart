import 'package:cores_navigation/providers.dart';
import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
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
          IconButton(
            onPressed: () => navigator.goWebView(context),
            icon: const Icon(
              Icons.web,
            ),
          ),
        ],
      ),
      body: const GitHubRepositoryList(),
    );
  }
}
