import 'dart:async';

import 'package:features_debug_mode/src/data/api/provider/exception_generator_api.dart';
import 'package:features_force_update/force_update.dart';
import 'package:features_maintain/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug_page.g.dart';

abstract interface class DebugPageNavigator {
  void goNavigationDebugPage(BuildContext context);
}

@Riverpod(dependencies: [])
DebugPageNavigator debugPageNavigator(Ref ref) => throw UnimplementedError();

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Mode'),
      ),
      body: Center(
        child: Column(
          children: [
            _FixSizedElevatedButton(
              title: 'Show error SnackBar',
              onPressed: () async {
                unawaited(
                  ref.read(exceptionGeneratorApiProvider.notifier).request(),
                );
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable maintenance mode',
              onPressed: () async {
                ref
                    .read(maintenanceModeProvider.notifier)
                    .update(enabled: true);
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable force update',
              onPressed: () async {
                ref.read(forceUpdateVersionProvider.notifier).update(
                      iosTargetVersion: VersionString('9.9.9'),
                      androidTargetVersion: VersionString('9.9.9'),
                    );
              },
            ),
            _FixSizedElevatedButton(
              title: 'Go navigation debug page',
              onPressed: () => ref
                  .read(debugPageNavigatorProvider)
                  .goNavigationDebugPage(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _FixSizedElevatedButton extends StatelessWidget {
  const _FixSizedElevatedButton({
    required String title,
    required VoidCallback onPressed,
  })  : _title = title,
        _onPressed = onPressed;

  final String _title;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Text(_title),
      ),
    );
  }
}
