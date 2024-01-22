import 'dart:async';
import 'package:cores_designsystem/components.dart';
import 'package:features_debug_mode/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/api/repository_api.dart';
import 'package:flutter_app/feature/setting/ui/setting_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(listPublicRepositoriesProvider);

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
                      return const DebugModePage();
                    },
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.construction,
            ),
          ),
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
      body: Center(
        child: repositories.when(
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) => TextListTile(
              text: value[index].name,
            ),
          ),
          error: (error, _) => Text(error.toString()),
          loading: CircularProgressIndicator.new,
        ),
      ),
    );
  }
}
