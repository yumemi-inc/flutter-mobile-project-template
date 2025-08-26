# UI Catalog

This application serves as a UI catalog for the project.
You can preview UI components by importing and deploying them from the design packages and other relevant packages.

Supports preview in browser and macOS environments.

![widgetbook preview](docs/preview.jpg)

## UI Preview UseCase Placement

It is recommended to place preview components under the use_case directory to mirror the directory structure of each package.

```text
lib
└── use_case
    ├── internal_design_ui
    │   └── components
    │       └── list_tiles.dart
    |── ${package_name}
    |   └── components
    |       └── ...
    └── material_components
        ├── actions
        |   ├── common_actions.dart
        │   └── ...
        ├── communication
        │   │── badge.dart
        |   └── ...
        └── ...
```

> Note: The directory structure of preview reflects only the directory structure of the Package from which it is defined.
>
> (There is no influence from the structure of the use_case directory.)

![ui structure](docs/ui_structure.jpg)
