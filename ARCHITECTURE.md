## Directory Structure

```text
.
├── app
├── cores
│   ├── ...
│   └── ...
└── features
    ├── ...
    └── ...
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
