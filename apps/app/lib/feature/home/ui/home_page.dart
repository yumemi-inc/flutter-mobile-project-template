import 'package:cores_navigation/providers.dart';
import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
<<<<<<< HEAD
    super.key,
  });
=======
    required VoidCallback goDebugModePage,
    required VoidCallback goSettingPage,
    required VoidCallback goWebView,
    super.key,
  })  : _goDebugModePage = goDebugModePage,
        _goSettingPage = goSettingPage,
        _goWebView = goWebView;

  final VoidCallback _goDebugModePage;
  final VoidCallback _goSettingPage;
  final VoidCallback _goWebView;
>>>>>>> main

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
            onPressed: _goWebView,
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
