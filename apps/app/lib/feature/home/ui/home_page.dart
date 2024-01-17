import 'dart:async';
import 'package:cores_designsystem/components.dart';
import 'package:cores_designsystem/gen/l10n/l10n.dart' as l10n;
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
        title: Text(l10n.L10n.of(context).appBar),
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
