import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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
