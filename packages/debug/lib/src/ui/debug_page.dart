import 'dart:async';

import 'package:cores_core/ui.dart';
import 'package:features_force_update/force_update.dart';
import 'package:features_maintain/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_debug/src/data/api/provider/exception_generator_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug_page.g.dart';

abstract interface class DebugPageNavigator {
  void goNavigationDebugPage(BuildContext context);
  void goTalkerPage(BuildContext context);
}

@Riverpod(dependencies: [])
DebugPageNavigator debugPageNavigator(Ref ref) => throw UnimplementedError();

@Riverpod(dependencies: [])
class EnableAccessibilityTools extends _$EnableAccessibilityTools {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String>>(
      exceptionGeneratorApiProvider,
      (_, value) {
        if (value.hasError) {
          SnackBarManager.showSnackBar(
            'An error occurred: ${value.error}',
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Mode'),
      ),
      body: Center(
        child: Column(
          children: [
            _FixSizedElevatedButton(
              title: 'Show error SnackBar',
              onPressed: () {
                unawaited(
                  ref.read(exceptionGeneratorApiProvider.notifier).request(),
                );
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable maintenance mode',
              onPressed: () {
                ref
                    .read(maintenanceModeProvider.notifier)
                    .update(enabled: true);
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable force update',
              onPressed: () {
                ref.read(forceUpdateProvider.notifier).debugEnableForceUpdate();
              },
            ),
            _FixSizedElevatedButton(
              title: 'Toggle accessibility tools',
              onPressed: () {
                ref.read(enableAccessibilityToolsProvider.notifier).toggle();
              },
            ),
            _FixSizedElevatedButton(
              title: 'Go navigation debug page',
              onPressed: () => ref
                  .read(debugPageNavigatorProvider)
                  .goNavigationDebugPage(context),
            ),
            _FixSizedElevatedButton(
              title: 'Go navigation talker page',
              onPressed: () =>
                  ref.read(debugPageNavigatorProvider).goTalkerPage(context),
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
  }) : _title = title,
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
