# GitHub Model Context Protocol (MCP) Server

## 概要

GitHub MCP Server はAIアシスタントからGitHubリポジトリを操作するための機能です。以下のような操作が可能です：

- プルリクエストの作成・更新・マージ
- イシューの作成・更新・コメント
- コードのレビュー

その他の機能については、[GitHub's official MCP Server](https://github.com/github/github-mcp-server) をご覧ください。

## 使い方

> [!Note]
> Cursor で使用されることを想定しています。

### 前提条件

1. [mcp.sample.json](../.cursor/mcp.sample.json) を `mcp.json` にファイル名を変更する
2. Personal Access Token （PAT）を取得する （[個人用アクセス トークンを管理する](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)）
   - プライベートリポジトリを操作する場合: `repo` スコープ（「プライベートリポジトリの完全な制御」）を選択
   - パブリックリポジトリのみを操作する場合: `public_repo` スコープのみを選択
3. `"<YOUR_TOKEN>"` を取得した PAT に書き換える
4. 現在 v0.3.0 の Github MCP Server を使用していますが、必要であれば別のバージョンハッシュ値に書き得てください（不要であればスキップ）
5. Cursor の設定から MCP Server を有効化する

### PR の作成

Cursor の Chat より [pr-creation.rule.mdc](../.cursor/rules/pr-creation-rule.mdc) を Context に追加し PR を作成してください。

## 利用上の注意点

### プライバシーとセキュリティ

- AIアシスタントとのやり取りでも機密情報の共有は避けてください

### 権限の制限

- MCP Server はユーザーに付与されたGitHub権限の範囲内でのみ操作が可能です
- 組織のリポジトリへのアクセスには適切な権限が必要です

### コミュニケーションのベストプラクティス

- 明確で具体的な指示を出すことで、意図した操作が行われやすくなります
- 複雑な操作は、段階的に指示することをおすすめします

## 参考

- [GitHub's official MCP Server](https://github.com/github/github-mcp-server)
