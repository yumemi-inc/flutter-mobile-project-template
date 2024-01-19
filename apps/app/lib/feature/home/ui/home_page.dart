import 'dart:async';
import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/setting/ui/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () {
              unawaited(
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) {
                      return const SettingPage();
                    },
                  ),
                ),
              );
            },
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
