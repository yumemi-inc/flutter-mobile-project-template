# features_package

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

新しい feature パッケージを作成します．

## Getting Started 🚀

以下のコマンドを実行します。

```shell
mason make features_package
```

feature 名を尋ねられるため、回答します。  
回答すると、以下の実行例のような構成のパッケージが `packages/features` 配下に作成されます。

```text
❯ mason make features_package           
? What is feature name? (example: foo_bar) foo_bar
✓ Generated 16 files. (72ms)
  created packages/features/foo_bar/test/foo_bar_test.dart
  created packages/features/foo_bar/l10n.yaml
  created packages/features/foo_bar/.metadata
  created packages/features/foo_bar/README.md
  created packages/features/foo_bar/pubspec.yaml
  created packages/features/foo_bar/.gitignore
  created packages/features/foo_bar/lib/ui.dart
  created packages/features/foo_bar/lib/l10n.dart
  created packages/features/foo_bar/lib/src/ui/components/foo_bar_text.dart
  created packages/features/foo_bar/lib/src/ui/pages/foo/components/foo_text.dart
  created packages/features/foo_bar/lib/src/ui/pages/foo/foo_page.dart
  created packages/features/foo_bar/lib/src/ui/pages/bar/bar_page.dart
  created packages/features/foo_bar/lib/src/ui/pages/bar/components/bar_text.dart
  created packages/features/foo_bar/lib/src/l10n/features_foo_bar_ja.arb
  created packages/features/foo_bar/lib/src/l10n/features_foo_bar_en.arb
  created packages/features/foo_bar/build.yaml
✓ Compiled post_gen.dart (2.4s)
```
