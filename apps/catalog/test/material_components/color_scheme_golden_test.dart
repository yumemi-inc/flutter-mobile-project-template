import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  Widget colorPreviewTile(Color color) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
    );
  }

  goldenTestsGroup(
    componentName: 'ColorScheme',
    testScenarios: [
      TestScenario(
        child: Builder(
          builder: (context) {
            final colors = Theme.of(context).colorScheme;
            return Wrap(
              children: [
                colorPreviewTile(colors.primary),
                colorPreviewTile(colors.onPrimary),
                colorPreviewTile(colors.primaryContainer),
                colorPreviewTile(colors.onPrimaryContainer),
                colorPreviewTile(colors.secondary),
                colorPreviewTile(colors.onSecondary),
                colorPreviewTile(colors.secondaryContainer),
                colorPreviewTile(colors.onSecondaryContainer),
                colorPreviewTile(colors.tertiary),
                colorPreviewTile(colors.onTertiary),
                colorPreviewTile(colors.tertiaryContainer),
                colorPreviewTile(colors.onTertiaryContainer),
                colorPreviewTile(colors.error),
                colorPreviewTile(colors.onError),
                colorPreviewTile(colors.errorContainer),
                colorPreviewTile(colors.onErrorContainer),
                colorPreviewTile(colors.surface),
                colorPreviewTile(colors.onSurface),
                colorPreviewTile(colors.onSurfaceVariant),
                colorPreviewTile(colors.surfaceTint),
                colorPreviewTile(colors.inverseSurface),
                colorPreviewTile(colors.onInverseSurface),
                colorPreviewTile(colors.outline),
                colorPreviewTile(colors.outlineVariant),
                colorPreviewTile(colors.scrim),
                colorPreviewTile(colors.shadow),
              ],
            );
          },
        ),
      ),
    ],
  );
}
