import 'package:features_maintain/src/gen/l10n/l10n.dart';
import 'package:features_maintain/src/ui/components/maintain_text.dart';
import 'package:features_maintain/src/ui/pages/list/components/maintain_list_text.dart';
import 'package:flutter/material.dart';

class MaintainListPage extends StatelessWidget {
  const MaintainListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.maintainListAppBarTitle),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaintainText(),
              MaintainListText(),
            ],
          ),
        ),
      ),
    );
  }
}
