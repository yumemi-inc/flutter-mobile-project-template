## Get Started

Language: English | [日本語](/docs/ja/GET_STARTED.md)

### IDE Versions

| IDE | Version |
| - | - |
| Android Studio | Ladybug 2024.2.1 Patch 3 |
| Xcode | 16.2 |

**Note**: We have confirmed that this project works with the IDE versions listed above. The project may not work properly with older or newer versions of these IDEs.

### Advance preparation

- Install the IDEs.
  - [IntelliJ IDEA], [Android Studio] or [Visual Studio Code]
  - [Xcode]
- Enable the [fvm] command.
  Also, run the following command to activate the Flutter version specified in `.fvmrc`:
  (Since both mason and melos may encounter issues when accessed through fvm, we recommend setting the current Flutter version as global in fvm)

  ```shell
  fvm use --force
  FLUTTER_VERSION=$(cat .fvmrc | yq ".flutter" -r) && fvm global $FLUTTER_VERSION
  ```

- Enable the [melos] command.
  - Please install the [yq] command if it is not already installed. The yq command is used to parse the `pubspec.lock` file to extract the version of the melos command.
  - Then, run the following command to globally activate the melos command.

    ```shell
    MELOS_VERSION=$(cat pubspec.lock | yq ".packages.melos.version" -r) && dart pub global activate melos $MELOS_VERSION
    ```

- Enable the [mason_cli] command.
  - Run the following command to globally activate the mason_cli command.

    ```shell
    MASON_VERSION=$(cat pubspec.lock | yq ".packages.mason_cli.version" -r) && dart pub global activate mason_cli $MASON_VERSION
    ```

  - Also, please run the following command to enable local bricks:

    ```shell
    mason get
    ```

### Set up the IDEs to use fvm

If you use [Visual Studio Code], reload the SDK by reloading the window.

If you use [IntelliJ IDEA] or [Android Studio], please see the following document:

<https://fvm.app/docs/getting_started/configuration#android-studio>

### Install dependencies

```shell
melos bootstrap
```

### Run app

The run-configurations are set up to run this app.

Please check:

- `.vscode/launch.json` for [Visual Studio Code].
- `.idea/runConfigurations/~.xml` for [IntelliJ IDEA] or [Android Studio].

<!-- Links -->

[IntelliJ IDEA]: https://www.jetbrains.com/idea/

[Android Studio]: https://developer.android.com/studio

[Visual Studio Code]: https://code.visualstudio.com/

[Xcode]: https://developer.apple.com/xcode/

[fvm]: https://fvm.app/

[melos]: https://melos.invertase.dev/

[mason_cli]: https://pub.dev/packages/mason_cli

[yq]: https://github.com/mikefarah/yq
