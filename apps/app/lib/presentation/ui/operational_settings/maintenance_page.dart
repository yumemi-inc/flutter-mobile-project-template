import 'package:flutter/material.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_app/presentation/providers/maintenance_mode_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                ref.read(maintenanceModeProvider.notifier).disable();
              },
              child: Text(l10n.maintainDisableButtonTitle),
            ),
          ],
        ),
      ),
    );
  }
}
