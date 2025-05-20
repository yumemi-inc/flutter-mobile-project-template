# ブランチ

## ブランチ保護ルール

[ブランチ保護ルール](https://docs.github.com/ja/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule) について記載します。

### ステータスチェック

[check-pr.yaml](../../.github/workflows/check-pr.yaml) に `status-check` ジョブがあります。
他のチェックジョブの結果を集約しているため、ステータスチェック対象のジョブを `status-check` ジョブのみ設定するだけでよくなる設計です。

`Require status checks to pass` の `Status checks that are required` に `status-check` を追加します。

![branch-rules-status-check.png](../images/branch-rules-status-check.png)

### マージキュー

概要は [GitHub公式ドキュメント: マージキューの管理](https://docs.github.com/ja/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue) を参照してください。

マージキューが有効になると、プルリクエストをマージする際に「**Confirm merge when ready**」が表示されます。このオプションを選択すると、プルリクエストはマージキューに追加され、[merge-queue.yaml](../../.github/workflows/merge-queue.yaml) ワークフローによって処理されます。

**`Require merge queue`** を有効化します。

![merge-queue-check.png](../images/merge-queue-check.png)
