# モデリング

## ドメインモデル設計方針

### レイヤードアーキテクチャの遵守

ドメインモデル（エンティティ・値オブジェクト）は全て `packages/domain_model` 配下に集約して管理します。
ドメインロジックやサービス的な処理は必要に応じて `packages/domain_logic` に分離しますが、純粋なデータ構造や値オブジェクトは必ず `domain_model` に配置します。

### イミュータブル設計

ドメインモデルは原則としてイミュータブル（不変）で設計します。
Dartの [`freezed` パッケージ](https://pub.dev/packages/freezed) や [Extension types](https://dart.dev/language/extension-types) を活用し、状態の変更は新しいインスタンスの生成で表現します。

### 値オブジェクトとエンティティの区別

- 値オブジェクト：同じ値であれば同一とみなす（例：`VersionString` など）
- エンティティ：一意な識別子や状態を持つ（例：`MaintenanceModeSettingsState` など）

### ドメインロジックの内包

値オブジェクトやエンティティは、単なるデータの入れ物ではなく、関連するドメインロジック（例：バージョン比較）も内包します。
複雑なドメインロジックやサービス的な処理は `domain_logic` に分離し、モデル自体には最小限のロジックのみを持たせます。

## 各領域（集約）ごとのクラス設計

### メンテナンスモード集約

```mermaid
classDiagram
    class MaintenanceModeSettingsState {
        +bool enabled
    }
```

### 強制アップデート集約

```mermaid
classDiagram
    class ForceUpdateSettingsState {
        +bool enabled
        +isForceUpdateEnabled(currentVersion: VersionString, forceUpdateTargetVersion: ForceUpdateTargetVersion): bool
    }
    class ForceUpdateTargetVersion {
        +VersionString ios
        +VersionString android
        +defaultTargetPlatformVersion: VersionString?
    }
    class VersionString {
        +String value
        +List<int> versionList
        +operator <, >, ==
    }
    ForceUpdateSettingsState --> ForceUpdateTargetVersion
    ForceUpdateTargetVersion --> VersionString
```

### ビルド構成集約

```mermaid
classDiagram
    class BuildConfig {
        <<interface>>
        +String appName
        +String packageName
        +String version
        +String buildNumber
        +String buildSignature
        +Flavor flavor
        +String? installerStore
    }
    class Flavor {
        <<enum>>
        dev
        stg
        prd
    }
    BuildConfig --> Flavor
```
