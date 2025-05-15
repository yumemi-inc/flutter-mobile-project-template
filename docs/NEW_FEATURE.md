# featureパッケージ追加からに画面遷移するまでの手順

## 1. features_package(masonのbrick) で新しいパッケージを作成

```shell
mason make features_package
```

> [!Note]
> `mason make`で失敗する場合はbrickのセットアップが終了していないかもしれません。
`mason list` でfeatures_packageが出ない場合は、`mason get`を実行してください。

featureの名前が聞かれるので以下のようにスネークケースで入力する。(以下新たに作成したfeature名はsampleとする)

```shell
What is feature name? (example: foo_bar): sample
```

features_packageでriverpodやfreezedを依存関係に含めるかを聞かれるので答える。

```shell
? Are you need riverpod? (Y/n)
? Are you need freezed? (Y/n)
```

その後`./packages/features/`に`sample`ができていることを確認する。

---

**既存のページから新しく作成した画面に遷移したい場合と
BottomNavigationBarに新たに画面を追加したい場合では手順が違うので分けて説明する**

## 2a. 遷移元が存在する場合 (Settingページから飛びたい場合等)

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
    return const SampleListPage();
  }
}
```

**4. `./apps/app/lib/router/provider/router.dart`に以下を追加**

```dart
// apps/app/lib/router/provider/router.dart

// 新たに作成されたfeatureのuiをimportする
import 'package:features_sample/ui.dart';
```

**5. appにTypedGoRouteを追加**

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

**6. navigatorとappのコード生成**
`./apps/app`内で以下のコマンドを実行しnavigatorとappのコード生成を行う。

```shell
melos run gen:build --no-select
```

**7. 画面遷移**
以下の関数で画面遷移ができることを確認する。

```dart
final navigator = ref.watch(settingPageNavigatorProvider);
navigator.goSamplePage(context);
```

## 4b. 遷移元が存在しない場合 (BottomNavigationBarに新たにタブを追加したい時)

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
          const NavigationDestination(
            label: 'sample',
            icon: Icon(Icons.heart_broken),
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
    return const SampleListPage();
  }
}

```

**3. `./apps/app/lib/router/provider/router.dart`に以下を追加**

```dart
// apps/app/lib/router/provider/router.dart

// 新たに作成されたfeatureのuiをimportする
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
melos run gen:build --no-select
```

**6. 新しくできたボトムナビゲーションのタブを押して画面遷移するか確認する**
