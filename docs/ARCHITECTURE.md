# アーキテクチャ

> [!TIP]
> 責務範囲はプロジェクトの開始時に議論するべきです。どのように分離するかはプロジェクトによって異なるためです。

## ディレクトリ構造

以下にディレクトリ構造を示します。

```text
.
├── apps
│   ├── app
│   │   ├── presentation
│   │   └── composition-root
│   └── catalog
│
└── packages
    ├── design-domain-ui # (optional)
    ├── design-ui
    ├── design-theme
    ├── application
    ├── infrastructure
    ├── domain-model
    └── domain-logic
```

## レイヤー・パッケージ構造

```mermaid
flowchart TD
  %% Style Definitions
  classDef directory fill:#f0f8ff,stroke:#333,stroke-width:2px,color:#000000;
  classDef package fill:#ffffe0,stroke:#333,stroke-width:2px,color:#000000;
  classDef optional fill:#ffffe0,stroke:#333,stroke-width:2px,stroke-dasharray:5 5,color:#000000;

  %% App Source Code (directly in app source)
  subgraph "App Source Code"
    direction TB
    subgraph "Presentation Layer"
      presentation[presentation]
      class presentation directory
    end
    subgraph "CompositionRoot Layer"
      composition_root[composition-root]
      class composition_root directory
    end
  end

  %% Design Layer
  subgraph "Design Layer"
    design_domain_ui["design-domain-ui (optional)"]
    class design_domain_ui optional

    design_ui[design-ui]
    class design_ui package

    design_theme[design-theme]
    class design_theme package
  end

  %% Application Layer
  subgraph "Application Layer"
    application_pkg[application]
    class application_pkg package
  end

  %% Infrastructure Layer
  subgraph "Infrastructure Layer"
    infrastructure_pkg[infrastructure]
    class infrastructure_pkg package
  end

  %% Domain Layer
  subgraph "Domain Layer"
    domain_model[domain-model]
    class domain_model package

    domain_logic[domain-logic]
    class domain_logic package
  end

  %% Dependencies
  presentation --> composition_root
  presentation --> domain_model
  presentation --> design_ui
  presentation --> design_domain_ui

  composition_root --> infrastructure_pkg
  composition_root --> application_pkg
  composition_root --> domain_logic

  application_pkg --> domain_model
  application_pkg --> domain_logic

  infrastructure_pkg --> domain_model
  infrastructure_pkg --> domain_logic

  design_domain_ui --> design_ui
  design_domain_ui --> design_theme
  design_domain_ui --> domain_model

  design_ui --> design_theme

  %% Legend
  subgraph "Legend"
    dir_legend[Directory]
    class dir_legend directory
    pkg_legend[Package]
    class pkg_legend package
    opt_legend[Optional Package]
    class opt_legend optional
  end
```
