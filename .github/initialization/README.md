# Initialization Issues

このディレクトリには、Yumemi Flutter プロジェクトテンプレートの初期化に必要なタスクのマークダウンファイルが含まれています。

## 自動Issue作成システム

各マークダウンファイルには YAML Front Matter でメタデータが設定されており、GitHub Actions によって自動的にIssueが作成されます。

### マークダウンファイルの構造

```markdown
---
title: "[初期セットアップ] タスクのタイトル"
labels: |
  initialization
  optional
---

# タスクの内容

ここにタスクの詳細を記述...
```

### メタデータフィールド

- `title`: GitHubのIssueタイトルとして使用される
- `labels`: Issueに付与するラベル（文字列または配列形式）

### 新しいタスクの追加方法

1. `.github/initialization/` ディレクトリに新しいマークダウンファイルを作成
2. YAML Front Matter でメタデータを設定
