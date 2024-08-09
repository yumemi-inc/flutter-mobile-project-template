import 'package:features_maintain/src/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';

class MaintainListText extends StatelessWidget {
  const MaintainListText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Text(l10n.maintainListText);
  }
}
