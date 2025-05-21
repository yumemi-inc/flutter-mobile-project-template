<!-- markdownlint-disable MD029 -->

# コミットメッセージ規約の設定

## 概要

このプロジェクトでは、[Conventional Commits]の仕様に従ったコミットメッセージのフォーマットを採用しています。
プロジェクトに応じて、コミットメッセージのフォーマットを変更する必要がある場合は、以下の手順に従ってください。

## 手順

### 1. コミットメッセージのフォーマットの確認

現在の`docs/COMMIT_CONVENTION.md`には、以下の内容が含まれています：

- 基本的なフォーマット
- コミットタイプ
- スコープの例
- 説明のルール
- 本文とフッターの記述ルール
- コミットメッセージの例

また、`commitlint`の設定ファイルである`commitlint.yaml`には、その設定が含まれています。

これらの内容を、プロジェクトの要件に合わせて更新してください。

### 2. コミットメッセージの検証設定

コミットメッセージが規約に従っているかを自動的に検証するために、以下の手順で設定を行います：

1. huskyを有効化します：

```sh
dart run husky install
```

2. commit-msgフックを追加して、コミットメッセージの検証を設定します：

```sh
dart run husky add .husky/commit-msg 'dart run commitlint_cli --edit "$1"'
```

## 参考

- [Conventional Commits]
- [@commitlint/config-conventional]
- [husky (pub.dev)]
- [commitlint_cli (pub.dev)]

<!-- Links -->

[Conventional Commits]: https://www.conventionalcommits.org/ja/v1.0.0/
[@commitlint/config-conventional]: https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional
[husky (pub.dev)]: https://pub.dev/packages/husky
[commitlint_cli (pub.dev)]: https://pub.dev/packages/commitlint_cli
