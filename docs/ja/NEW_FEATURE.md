# featureパッケージ追加からに画面遷移するまでの手順

言語: 日本語 | [English](/docs/en/NEW_FEATURE.md)

## 1. appのpubspecに依存を追加

```shell
mason get && melos bs
```

## 2. 新規brickを作成

```bash
mason make features_package
```

featureの名前が聞かれるので以下のようにスネークケースで入力する。(以下新たに作成したfeature名はsampleとする)

```shell
What is feature name? (example: foo_bar): sample
```

features_packageでriverpodやfreezedを依存関係に含めるかを聞かれるので答える。

```bash
? Are you need riverpod? (Y/n) Yes
? Are you need freezed? (Y/n) Yes
```

その後`./packages/features/`に`sample`ができていることを確認する。

## 3. 作成したfeatureをappsの依存関係に追加

作成したfeatureをappsの依存関係に追加するために、`apps/app/pubspec.yaml`に作成したfeatureのパスを追記

```yaml
// apps/app/pubspec.yaml
  ...
  features_sample:
    path: ../../packages/features/sample
```

以下のコマンドで追加された依存関係を読み込む

```shell
melos bs
```

**既存のページから新しく作成した画面に遷移したい場合と
BottomNavigationBarに新たに画面を追加したい場合では手順が違うので分けて説明する**

## 4a. 遷移元が存在する場合 (Settingページから飛びたい場合)

sampleをsettingページから遷移させる場合をここでは示す。

**1. navigatorパッケージの遷移元機能のNavigatorにメソッドの宣言を追加**

```dart
// packages/features/setting/lib/src/ui/setting_page.dart
abstract interface class SettingPageNavigator {
  void goLicensePage(BuildContext context);
  
  /// 以下を追加
  void goSamplePage(BuildContext context); 
}
```

**2. appのNavigatorの実装にgoメソッドの実装を追加**

```dart
// apps/app/lib/router/routes/main/setting/setting_shell_branch.dart

final class _SettingPageNavigatorImpl implements SettingPageNavigator {
  ...
  /// 以下を追加
  @override
  void goSamplePage(BuildContext context) {
    const SamplePageRoute().go(context);
  }
}
```

**3. appに新画面のRouteを追加**
`path`にsettingから見た相対パスを代入する

```dart
// ./apps/app/lib/router/routes/main/setting/setting_shell_branch.dart
...
class SamplePageRoute extends GoRouteData {
  const SamplePageRoute();

  static const path = 'sample';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SampleListPage(
      applicationIcon: CommonAssets.yumemiLogo.image(height: 100, width: 100),
    );
  }
}
```

**4. appにTypedGoRouteを追加**

```dart
// apps/app/lib/router/routes/main/setting/setting_shell_branch.dart

const settingShellBranch = TypedStatefulShellBranch<SettingShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingPageRoute>(
      path: SettingPageRoute.path,
      routes: [
        TypedGoRoute<LicensePageRoute>(
          path: LicensePageRoute.path,
        ),
        /// 以下を追加
        TypedGoRoute<SamplePageRoute>(
          path: SamplePageRoute.path,
        ),
      ],
    ),
  ],
);
```

**5. navigatorとappのコード生成**
`./apps/app`内で以下のコマンドを実行しnavigatorとappのコード生成を行う。

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

**6. 画面遷移**
以下の関数で画面遷移ができることを確認する。

```dart
navigator.goSamplePage(context)
```

**7. `main.dart`で追加パッケージのl10nをMaterialAppに追加**

```dart
// apps/app/lib/main.dart

import 'package:features_sample/l10n.dart'; // importする

return MaterialApp.router(
 localizationsDelegates: const [
  ...L10n.localizationsDelegates,
  ...SettingL10n.localizationsDelegates,
  ...SampleL10n.localizationsDelegates, // 追加
 ],
 supportedLocales: const [
  ...L10n.supportedLocales,
  ...SettingL10n.supportedLocales,
  ...SampleL10n.supportedLocales, // 追加
 ],
 scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
 routerConfig: ref.watch(routerProvider),
 theme: lightTheme(),
 darkTheme: darkTheme(),
 themeMode: themeMode,
);
```

## 4b. 遷移元が存在しない場合 (BottomNavigationBarに新たに画面を追加したい時)

**1. 新しいNavigationDestinationを追加**

```dart
// apps/app/lib/main_page.dart

Widget build(BuildContext context, WidgetRef ref) {
    final l = L10n.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            label: l.bottomTabHome,
            icon: const Icon(Icons.home),
          ),
          NavigationDestination(
            label: l.bottomTabSettings,
            icon: const Icon(Icons.settings),
          ),
          //ここに追加
          NavigationDestination(
            label: "sample",
            icon: const Icon(Icons.heart_broken),
          ),
        ],
```

**2. 新たにshell branchを定義**
`apps/app/lib/router/routes/main`に新たに`sample`フォルダーを作り、その直下で以下の`sample_shell_branch.dart`を作る

```dart
// apps/app/lib/router/routes/main/sample/sample_shell_branch.dart

part of 'package:flutter_app/router/provider/router.dart';

const sampleShellBranch = TypedStatefulShellBranch<SampleShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SamplePageRoute>(
      path: SamplePageRoute.path,
    ),
  ],
);

class SampleShellBranch extends StatefulShellBranchData {
  const SampleShellBranch();
}

class SamplePageRoute extends GoRouteData {
  const SamplePageRoute();

  static const path = '/sample';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SamplePage();
  }
}
```

**3. `./apps/app/lib/router/provider/router.dart`に以下を追加**

```dart
// apps/app/lib/router/provider/router.dart

// 新たに作成されたfeatureをimport可能にする
import 'package:features_sample/ui.dart';

// 新たに作成されたShellBranchを有効化する
part 'package:flutter_app/router/routes/main/sample/sample_shell_branch.dart';
```

**4. `main_page_shell_route.dart`に`sampleShellBranch`を追加**

```dart
// apps/app/lib/router/routes/main/main_page_shell_route.dart

part of 'package:flutter_app/router/provider/router.dart';

@TypedStatefulShellRoute<MainPageShellRoute>(
  branches: [
    homeShellBranch,
    settingShellBranch,
    sampleShellBranch, // 追加する
  ],
)
class MainPageShellRoute extends StatefulShellRouteData {
  const MainPageShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainPage(navigationShell: navigationShell);
  }
}
```

**5. `./apps/app`にて、go_router周りのコード生成**

```shell
fvm dart run build_runner build --delete-conflicting-outputs
```

**6. `main.dart`で追加パッケージのl10nをMaterialAppに追加**

```dart
// apps/app/lib/main.dart

import 'package:features_sample/l10n.dart'; // importする

return MaterialApp.router(
      localizationsDelegates: const [
        ...L10n.localizationsDelegates,
        ...SettingL10n.localizationsDelegates,
        ...SampleL10n.localizationsDelegates, // 追加
      ],
      supportedLocales: const [
        ...L10n.supportedLocales,
        ...SettingL10n.supportedLocales,
        ...SampleL10n.supportedLocales, // 追加
      ],
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
    );
```
