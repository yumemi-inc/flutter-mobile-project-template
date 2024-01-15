import 'package:cores_designsystem/components.dart';
import 'package:cores_designsystem/gen/l10n/l10n.dart' as l10n;
import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/api/repository_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(listPublicRepositoriesProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.L10n.of(context).appBar)),
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
