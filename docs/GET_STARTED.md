## Get Started

### Advance preparation

- Install the IDEs.
    - [IntelliJ IDEA], [Android Studio] or [Visual Studio Code]
    - [Xcode]
- Enable the [fvm] command.
- Enable the [melos] command.
    - Please install the [yq] command if it is not already installed. The yq command is used to parse the `pubspec.lock` file to extract the version of the melos command.
    - Then, run the following command to globally activate the melos command.

        ```shell
        MELOS_VERSION=$(cat pubspec.lock | yq ".packages.melos.version" -r)
        fvm dart pub global activate melos $MELOS_VERSION
        ```

- Enable the [mason_cli] command.

### Set up Flutter SDK

```shell
fvm use --force
```

### Set up the IDEs to use fvm

If you use [Visual Studio Code], reload the SDK by reloading the window.

If you use [IntelliJ IDEA] or [Android Studio], please see the following document:

https://fvm.app/docs/getting_started/configuration#android-studio

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
