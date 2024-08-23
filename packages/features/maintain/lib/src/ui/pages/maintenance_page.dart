import 'package:features_maintain/src/gen/l10n/l10n.dart';
import 'package:features_maintain/src/provider/maintenance_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaintenancePage extends ConsumerWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.maintainAppBar),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.maintainDescription,
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(maintenanceModeProvider.notifier)
                    .update(enabled: false);
              },
              child: Text(l10n.maintainDisableButtonTitle),
            ),
          ],
        ),
      ),
    );
  }
}
