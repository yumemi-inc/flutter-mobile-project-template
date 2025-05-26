# コミットメッセージ規約の設定

このプロジェクトでは、[Conventional Commits]の仕様に従ったコミットメッセージ規約を採用しています。
プロジェクトに応じて、コミットメッセージ規約を変更することができます。

## 規約の変更を行う場合

現在の`docs/COMMIT_CONVENTION.md`には、以下の内容が含まれています：

- 基本的なフォーマット
- コミットタイプ
- スコープの例
- 説明のルール
- 本文とフッターの記述ルール
- コミットメッセージの例

また、[`commitlint`]の設定ファイルである`.commitlintrc.yaml`には、その設定が含まれています。

これらの内容を、プロジェクトの要件に合わせて更新してください。

## 規約の変更を行わない場合

規約を変更しない場合は、このIssueをクローズしてください。

## 参考

- [Conventional Commits]
- [`@commitlint/config-conventional`]
- [`husky`]
- [`commitlint`]

<!-- Links -->

[Conventional Commits]: https://www.conventionalcommits.org/ja/v1.0.0/
[`@commitlint/config-conventional`]: https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional
[`husky`]: https://typicode.github.io/husky/
[`commitlint`]: https://commitlint.js.org/
