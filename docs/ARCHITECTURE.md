## Directory Structure

```text
.
├── apps
│   ├── app
│   └── catalog
│
└── packages
    ├── cores
    │   ├── core
    │   ├── data
    │   ├── designsystem
    │   └── init
    │
    └── features
        ├── debug_mode
        └── github_repository
```

## Architecture

```mermaid
flowchart TB
    app
    cores
    features
    app --> cores & features
    features --> cores
    cores --> cores
```
