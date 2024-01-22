import 'package:cores_designsystem/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/api/repository_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    required VoidCallback goSettingPage,
    super.key,
  }) : _goSettingPage = goSettingPage;

  final VoidCallback _goSettingPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(listPublicRepositoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: _goSettingPage,
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
