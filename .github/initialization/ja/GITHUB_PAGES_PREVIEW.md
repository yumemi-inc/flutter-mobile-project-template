# GitHub Pages プレビュー

この Issue の対応は任意です。

このプロジェクトでは `apps/catalog` の Widgetbook を PullRequest 時にプレビューできるようにするワークフローが用意されています。
プレビューは GitHub Pages 上にデプロイされます。

ワークフローを有効化するためには、以下の手順に従って設定してください。

## 1. カスタム GitHub Actions ワークフローによる公開設定

[ドキュメント][1] に従ってGitHub Actions ワークフローでGitHub Pageにデプロイ可能にする。

## 2. Visibilityの有効化

[ドキュメント][2] に従って`Visibility`を有効化することにより、アクセス制限を設定する。

## 3. ワークフローの内容を変更する

`.github/workflows/github-pages-pull-request.yml` を修正する。

### 3-1. リポジトリ名条件の削除

このテンプレートプロジェクトを元に新規プロジェクトを作成した際に、誤ってワークフローが実行されないように、リポジトリ名による有効化条件を記述しています。この記述はセットアップ後は不要になりますので、削除してください。

![github-pages-pull-request.png](https://github.com/user-attachments/assets/04475d96-986d-44de-b945-25c4308b5d26)

<!-- Links -->

[1]: https://docs.github.com/ja/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%A0-github-actions-%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC%E3%81%AB%E3%82%88%E3%82%8B%E5%85%AC%E9%96%8B

[2]: https://docs.github.com/ja/enterprise-cloud@latest/pages/getting-started-with-github-pages/changing-the-visibility-of-your-github-pages-site
