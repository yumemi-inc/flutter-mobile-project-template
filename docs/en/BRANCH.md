# Branch

Language: English | [日本語](/docs/ja/BRANCH.md)

## Branch protection rule

This section describes
the [Branch protection rule](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule).

### status check

There is a status-check job in [check-pr.yaml](../../.github/workflows/check-pr.yaml).
Since it aggregates the results of other check jobs, it is designed so that only the `status-check`
job needs to be set
as
a status check target.

Add `status-check` to `Status checks that are required` in `Require status checks to pass`.

![branch-rules-status-check.png](../images/branch-rules-status-check.png)
