import 'package:flutter/material.dart';

/// [SettingSectionSpacer] is a widget that represents the space for
/// each section of the settings screen.
final class SettingSectionSpacer extends StatelessWidget {
  const SettingSectionSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(
        bottom: 16,
      ),
    );
  }
}
