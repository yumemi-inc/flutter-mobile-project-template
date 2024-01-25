import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required VoidCallback goDebugModePage,
    required VoidCallback goSettingPage,
    super.key,
  })  : _goDebugModePage = goDebugModePage,
        _goSettingPage = goSettingPage;

  final VoidCallback _goDebugModePage;
  final VoidCallback _goSettingPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: _goDebugModePage,
            icon: const Icon(
              Icons.construction,
            ),
          ),
          IconButton(
            onPressed: _goSettingPage,
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
