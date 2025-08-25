import 'package:flutter/material.dart';

/// [SettingSectionTitle] is a widget that represents the section title of
/// the settings screen.
final class SettingSectionTitle extends StatelessWidget {
  /// You can set the text to be displayed as the title in [text].
  const SettingSectionTitle({
    required String text,
    super.key,
  }) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 24,
    ),
    sliver: SliverToBoxAdapter(
      child: Text(_text),
    ),
  );
}
