# [初期セットアップ] Model Context Protocol (MCP) Server の設定

## 目的

AIアシスタント (Cursor など) がローカル環境やクラウドサービス (GitHub など) と安全に対話するための Model Context Protocol (MCP) Server を設定します。

## 背景

MCP Server を利用することで、AIアシスタントから直接リポジトリ操作 (PR作成、Issue作成、Gitコマンド実行など) が可能になり、開発効率の向上が期待できます。
このテンプレートプロジェクトでは、主要な MCP Server の設定ファイルサンプル ([mcp.sample.json]) が含まれています。プロジェクト開始時にこれらの設定を行い、利用上の注意点をチームで共有します。

## タスク

### 1. 事前準備

- [ ] **MCP Server の選定**: プロジェクトの要件に基づき、有効化する MCP Server を選定します。(例: GitHub MCP Server, Git MCP Server)
- [ ] **設定ファイルの準備**:
  - [ ] [mcp.sample.json] をコピーし、ファイル名を `mcp.json` に変更します。 (通常は `.cursor/mcp.json` に配置されます)
- [ ] **利用上の注意点の確認**:
  - [ ] 機密情報の取り扱い (AIアシスタントとのやり取りでも共有を避ける)
  - [ ] MCP Server の権限 (ユーザーに付与された権限の範囲内でのみ操作可能)
  - [ ] コミュニケーションのベストプラクティス (明確な指示、複雑な操作は段階的に)

### 2. GitHub MCP Server の設定 (必要な場合)

GitHubリポジトリ操作 (PR作成、Issue更新など) のために GitHub MCP Server を有効化します。

- [GitHub MCP Server]

### 3. git MCP Server の設定 (必要な場合)

ローカルのGitコマンド操作 (status確認、commit、branch操作など) のために git MCP Server を有効化します。

- [git MCP Server]

## 完了条件

- 上記タスクのうち、選定したMCP Serverに関する設定が完了していること。
- `mcp.json` が正しく設定されていること。
- Cursor から選択したMCP Serverが利用可能になっていること。
- チームメンバーがMCP Serverの利用上の注意点を理解していること。

## 参考資料

- [GitHub's official MCP Server]
- [git MCP Server README]
- [Model Context Protocol (MCP) Server 概要ドキュメント]

<!-- Links -->

[mcp.sample.json]: ../../.cursor/mcp.sample.json
[GitHub's official MCP Server]: https://github.com/github/github-mcp-server
[git MCP Server README]: https://github.com/modelcontextprotocol/servers/tree/2025.4.24/src/git
[Model Context Protocol (MCP) Server 概要ドキュメント]: ../../docs/SETUP_MCP_SERVER.md
[GitHub MCP Server]: ../../docs/SETUP_MCP_SERVER.md#github-model-context-protocol-mcp-server
[git MCP Server]: ../../docs/SETUP_MCP_SERVER.md#git-model-context-protocol-mcp-server
