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
    apps/app
    cores/core
    cores/data
    cores/designsystem
    cores/init
    features/debug_mode
    features/github_repository

    apps/app --> cores/data & cores/designsystem & cores/init & features/debug_mode & features/github_repository
    features/debug_mode --> cores/core & cores/data & cores/designsystem
    features/github_repository --> cores/data & cores/designsystem
    cores/core --> cores/data
    cores/data --> cores/init
```
