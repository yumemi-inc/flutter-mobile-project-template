---
title: "[初期セットアップ（任意）] Pull Request内でデプロイのワークフローを設定する"
labels:
    - initialization
	- optional
---

# GitHub Pages プレビュー

この Issue の対応は任意です。

このプロジェクトでは `apps/catalog` の Widgetbook を PullRequest 時にプレビューできるようにするワークフローが用意されています。
プレビューは GitHub Pages 上にデプロイされます。

ワークフローを有効化するためには、以下の手順に従って設定してください。

## 1. カスタム GitHub Actions ワークフローによる公開設定

[カスタム GitHub Actions ワークフローによる公開][1] に従ってGitHub Actions ワークフローでGitHub Pageにデプロイ可能にする。

## 2. Visibilityの有効化

[GitHub Pages サイトの可視性を変更する][2] に従って`Visibility`を有効化することにより、アクセス制限を設定する。
ただし、この機能は`GitHub Enterprise Cloud`を契約している`Organization`でしか利用できません。
`GitHub Enterprise Cloud`以外で非公開のデプロイを行いたい場合、

- `AWS CloudFront`
- `Cloudflare Pages` + `Zero Trust`

等を検討してください。

## 3. デプロイ環境の設定確認

`GitHub Pages`へデプロイ可能なブランチを制限します。
`Settings` ⇨ `Environments`から`github-pages`環境を選択し、デプロイ可能なブランチを指定してください。

`Deployment branches and tags`では、以下の3つのオプションからプロジェクトに適した設定を選択できます：

- `No restriction`: すべてのブランチからデプロイ可能
- `Protected branches only`: 保護されたブランチからのみデプロイ可能
- `Selected branches and tags`: 指定したブランチやタグパターンに一致するもののみデプロイ可能

セキュリティ要件や運用方針に応じて、適切な制限を設定することをお勧めします。

## 4. ワークフローの内容を変更する

`.github/workflows/github-pages-pull-request.yml` を修正する。

### 4-1. リポジトリ名条件の削除

このテンプレートプロジェクトを元に新規プロジェクトを作成した際に、誤ってワークフローが実行されないように、リポジトリ名による有効化条件を記述しています。この記述はセットアップ後は不要になりますので、削除してください。

![github-pages-pull-request.png](https://github.com/user-attachments/assets/324da9ca-078d-4b8f-a7bc-b6441c2c8564)

<!-- Links -->

[1]: https://docs.github.com/ja/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%A0-github-actions-%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC%E3%81%AB%E3%82%88%E3%82%8B%E5%85%AC%E9%96%8B
[2]: https://docs.github.com/ja/enterprise-cloud@latest/pages/getting-started-with-github-pages/changing-the-visibility-of-your-github-pages-site
