import 'dart:async';

import 'package:cores_core/app_status.dart';
import 'package:cores_navigation/providers.dart';
import 'package:features_debug_mode/src/data/api/provider/exception_generator_api.dart';
import 'package:features_debug_mode/src/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(debugNavigatorProvider);
    final l10n = L10nDebug.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.debugAppBar),
      ),
      body: Center(
        child: Column(
          children: [
            _FixSizedElevatedButton(
              title: l10n.showErrorSnackBar,
              onPressed: () async {
                unawaited(
                  ref.read(exceptionGeneratorApiProvider.notifier).request(),
                );
              },
            ),
            _FixSizedElevatedButton(
              title: l10n.enableMaintenanceMode,
              onPressed: () async {
                ref
                    .read(maintenanceModeProvider.notifier)
                    .update(enabled: true);
              },
            ),
            _FixSizedElevatedButton(
              title: l10n.enableForceUpdate,
              onPressed: () async {
                ref.read(forceUpdateVersionProvider.notifier).update(
                      iosTargetVersion: '9.9.9',
                      androidTargetVersion: '9.9.9',
                    );
              },
            ),
            _FixSizedElevatedButton(
              title: l10n.navigation,
              onPressed: () => navigator.goNavigationPage(context),
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
