import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  Widget textStylePreviewTile({
    required Widget title,
    required TextStyle? textStyle,
  }) =>
      ListTile(
        title: title,
        titleTextStyle: textStyle,
      );

  goldenTestsGroup(
    componentName: 'Typography',
    testScenarios: [
      TestScenario(
        child: Builder(
          builder: (context) {
            final theme = Theme.of(context);
            return ListView(
              children: [
                // Display
                textStylePreviewTile(
                  title: const Text('Display Large'),
                  textStyle: theme.textTheme.displayLarge,
                ),
                textStylePreviewTile(
                  title: const Text('Display Medium'),
                  textStyle: theme.textTheme.displayMedium,
                ),
                textStylePreviewTile(
                  title: const Text('Display Small'),
                  textStyle: theme.textTheme.displaySmall,
                ),
                // Headline
                textStylePreviewTile(
                  title: const Text('Headline Large'),
                  textStyle: theme.textTheme.headlineLarge,
                ),
                textStylePreviewTile(
                  title: const Text('Headline Medium'),
                  textStyle: theme.textTheme.headlineMedium,
                ),
                textStylePreviewTile(
                  title: const Text('Headline Small'),
                  textStyle: theme.textTheme.headlineSmall,
                ),
                // Title
                textStylePreviewTile(
                  title: const Text('Title Large'),
                  textStyle: theme.textTheme.titleLarge,
                ),
                textStylePreviewTile(
                  title: const Text('Title Medium'),
                  textStyle: theme.textTheme.titleMedium,
                ),
                textStylePreviewTile(
                  title: const Text('Title Small'),
                  textStyle: theme.textTheme.titleSmall,
                ),
                // Body
                textStylePreviewTile(
                  title: const Text('Body Large'),
                  textStyle: theme.textTheme.bodyLarge,
                ),
                textStylePreviewTile(
                  title: const Text('Body Medium'),
                  textStyle: theme.textTheme.bodyMedium,
                ),
                textStylePreviewTile(
                  title: const Text('Body Small'),
                  textStyle: theme.textTheme.bodySmall,
                ),
                // Label
                textStylePreviewTile(
                  title: const Text('Label Large'),
                  textStyle: theme.textTheme.labelLarge,
                ),
                textStylePreviewTile(
                  title: const Text('Label Medium'),
                  textStyle: theme.textTheme.labelMedium,
                ),
                textStylePreviewTile(
                  title: const Text('Label Small'),
                  textStyle: theme.textTheme.labelSmall,
                ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
