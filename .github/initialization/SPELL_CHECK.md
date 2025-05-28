# [初期セットアップ] CSpell を活用したスペルチェックの導入

## 目的

開発者間での表記揺れやスペルミスによる混乱を防ぎ、コードとドキュメントの品質を向上させるために、[CSpell] を利用したスペルチェックを導入・運用します。

## 背景

このテンプレートプロジェクトには、[CSpell] の設定ファイル ([cspell.jsonc]) とカスタム辞書 (`.cspell/project-term.txt`) 、およびCIでの自動チェックワークフローが含まれています。
プロジェクト開始時にこれらの設定を確認し、チームメンバーに運用ルールを周知することで、スムーズな開発を促進します。

## タスク

- [ ] **CSpell設定の確認**:
  - [ ] `cspell.jsonc` ファイルの内容を確認し、プロジェクトの特性に合わせて必要であれば調整します。
    - チェック対象/対象外のファイルやディレクトリ
    - 使用するカスタム辞書、外部辞書
    - 無視する単語や正規表現パターン
  - 参考: [CSpell Configuration](https://cspell.org/docs/Configuration)
- [ ] **カスタム辞書の確認と運用**:
  - [ ] `.cspell/project-term.txt` を確認し、プロジェクト固有の用語や略語が登録されているか、または追加する必要があるか検討します。
  - [ ] スペルチェックで誤検知があった場合、該当する辞書ファイルに単語を追加し、Pull Requestでレビューを受ける運用ルールをチームで共有します。
  - 参考: [Custom Dictionaries](https://cspell.org/docs/dictionaries/custom-dictionaries)
- [ ] **CI連携の確認**:
  - [ ] Pull Request 作成時に GitHub Actions ([.github/workflows/check-pr.yaml] および [.github/workflows/wc-check-spell.yaml]) によって自動的にスペルチェックが実行されることを確認します。
- [ ] **ローカルでの実行方法の周知**:
  - [ ] 以下のコマンドでローカル環境でスペルチェックを実行できることをチームメンバーに周知します。

  ```sh
  # 必要なツールやパッケージのインストール (初回のみ)
  mise install

  # プロジェクト全体のスペルチェック実行
  mise run cspell
  ```

- [ ] **VS Code拡張機能の推奨**:
  - [ ] CSpell の VS Code 拡張機能 ([Street Side Software Spell Checker](https://streetsidesoftware.com/vscode-spell-checker/)) の利用をチームメンバーに推奨します。
    - インストールすると、`cspell.jsonc` やカスタム辞書が自動的に認識され、編集中にリアルタイムでスペルチェックが行われます。

## 完了条件

- 上記タスクが全て完了していること。
- チームメンバーがCSpellの基本的な使い方と運用ルールを理解していること。

<!-- Links -->

[CSpell]: https://cspell.org/
[cspell.jsonc]: ../../../cspell.jsonc
[.github/workflows/check-pr.yaml]: ../../workflows/check-pr.yaml
[.github/workflows/wc-check-spell.yaml]: ../../workflows/wc-check-spell.yaml
