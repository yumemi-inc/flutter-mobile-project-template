import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

import 'utils/path.dart';

extension YamlMapToJson on YamlMap {
  Map<String, dynamic> toJson() {
    final jsonString = jsonEncode(this);
    final toJson = jsonDecode(jsonString) as Map<String, dynamic>;
    return toJson;
  }
}

/// pubspec.yaml と pubspec.lock ファイルの差分を分析し、Markdown フォーマットで出力するツール
///
/// このツールは以下の２つの比較を行います：
/// 1. 現在のブランチと 指定した ブランチの pubspec.lock ファイルの差分
/// 2. 現在の pubspec.yaml と pubspec.lock のパッケージバージョン表記の違い
///
/// 使用例:
/// ```dart
/// dart diff_yaml.dart pubspec.yaml pubspec.lock
/// ```
///
/// 出力形式:
/// 1. pubspec.lock の変更がある場合:
/// ```markdown
/// ## pubspec.lock has been changed
/// | Change | Diff |
/// | :---   | :--- |
/// | package.version | {"previous": "1.0.0", "current": "2.0.0"} |
/// ```
///
/// 2. バージョン表記の違いがある場合:
/// ```markdown
/// Compare pubspec.yaml and pubspec.lock. Packages with
/// different version notations
/// | package | pubspec.yaml | pubspec.lock |
/// | :---    | :---         | :---         |
/// | package_name | ^1.0.0 | 1.0.1 |
/// ```
///
/// パラメータ:
/// * [args] - コマンドライン引数
///   - args[0]: 比較対象のブランチ
///   - args[1]: pubspec.yaml のパス
///   - args[2]: pubspec.lock のパス
///
/// 例外:
/// * [ProcessException] - Git コマンドの実行に失敗した場合
/// * [FileSystemException] - ファイルの読み込みに失敗した場合
Future<void> main(List<String> args) async {
  final refBranch = args[0];
  final yamlPath = args[1];
  final lockPath = args[2];

  final rootDir = fetchGitRootDirPath();

  final yamlFile = File(join(rootDir, yamlPath));
  final currentYaml = loadYaml(yamlFile.readAsStringSync()) as YamlMap;
  final lockFile = File(join(rootDir, lockPath));
  final currentLock = loadYaml(lockFile.readAsStringSync()) as YamlMap;

  final compareValue = await diffLockContent(refBranch, lockPath, currentLock);

  final rows = <String>[];

  if (compareValue.isNotEmpty) {
    rows.add('''
## pubspec.lock has been changed

| Change | Diff |
| :---   | :--- |
''');

    for (final entry in compareValue.entries) {
      final row = '|${entry.key}|${entry.value}|\n';
      rows.add(row);
    }

    rows.add('---');
  }

  final diffVersions = diffPkgVersion(currentYaml, currentLock);

  if (diffVersions.isNotEmpty) {
    rows.add('''

## Compare pubspec.yaml and pubspec.lock. Packages with different version notations

| package | pubspec.yaml | pubspec.lock |
| :---    | :---         | :---         |
''');

    for (final diff in diffVersions) {
      final row =
          '''| ${diff['package']} | ${diff['pubspec.yaml']} | ${diff['pubspec.lock']} | \n''';
      rows.add(row);
    }
  }

  stdout.writeln(rows.join().trim());
}

/// 実行ブランチとorigin/mainのpubspec.lockの内容を比較し、表記が異なるものを返す
Future<Map<String, dynamic>> diffLockContent(
  String branch,
  String path,
  YamlMap lock, {
  String remoteRepoName = 'origin',
}) async {
  const executable = 'git';

  final fetchArguments = ['fetch', remoteRepoName, branch];
  final exitCode =
      await Process.run(executable, fetchArguments).then((e) => e.exitCode);
  if (exitCode != 0) {
    throw ProcessException(
      executable,
      fetchArguments,
      'Failed to execute git fetch origin main',
    );
  }

  final showArguments = ['show', '$remoteRepoName/$branch:$path'];
  final (success, error) = await Process.run(executable, showArguments)
      .then((value) => (value.stdout as String, value.stderr as String));

  if (error.isNotEmpty) {
    throw ProcessException(
      executable,
      showArguments,
      'Failed to execute git show $remoteRepoName/$branch:$path / $stderr',
    );
  }
  final mainLock = loadYaml(success) as YamlMap;

  return compareMap(mainLock.toJson(), lock.toJson());
}

/// pubspec.yamlとpubspec.lockの内容を参照し、versionの表記が異なるものを返す
Iterable<Map<String, String>> diffPkgVersion(
  YamlMap yaml,
  YamlMap lock,
) {
  final yamlJson = yaml.toJson();

  final pkgYaml = <String, dynamic>{}
    ..addAll(yamlJson['dev_dependencies'] as Map<String, dynamic>)
    ..addAll(yamlJson['dependency_overrides'] as Map<String, dynamic>)
    ..addAll(
      // NOTE: 厳密な型変換は可読性が低下する為
      // ignore: avoid_dynamic_calls
      yamlJson['melos']['command']['bootstrap']['dependencies']
          as Map<String, dynamic>,
    )
    ..addAll(
      // NOTE: 厳密な型は可読性が低下する為
      // ignore: avoid_dynamic_calls
      yamlJson['melos']['command']['bootstrap']['dev_dependencies']
          as Map<String, dynamic>,
    );

  final lockPackages = Map<String, dynamic>.from(lock['packages'] as Map);

  return lockPackages.entries.where((lockPkg) {
    final name = lockPkg.key;

    if (pkgYaml.containsKey(name)) {
      final yamlVersion = (pkgYaml[name] as String).replaceFirst('^', '');
      final lockVersion = (lockPkg.value as Map)['version'].toString();

      return yamlVersion != lockVersion;
    }

    return false;
  }).map(
    (e) => {
      'package': e.key,
      'pubspec.yaml': pkgYaml[e.key] as String,
      'pubspec.lock': (e.value as Map)['version'] as String,
    },
  );
}

/// Compares Maps and returns a [Map<String, dynami>] of the elements
/// that differ between [previous] and [current].

Map<String, dynamic> compareMap(
  Map<String, dynamic> previous,
  Map<String, dynamic> current, [
  String prefix = '',
]) {
  final result = <String, dynamic>{};

  final allKeys = {...previous.keys, ...current.keys};

  for (final key in allKeys) {
    final fullKey = prefix.isEmpty ? key : '$prefix.$key';
    final previousValue = previous[key];
    final currentValue = current[key];

    if (previousValue is Map || currentValue is Map) {
      final childDiff = compareMap(
        previousValue as Map<String, dynamic>? ?? {},
        currentValue as Map<String, dynamic>? ?? {},
        fullKey,
      );
      if (childDiff.isNotEmpty) {
        result.addAll(childDiff);
      }
    } else if (previousValue != currentValue) {
      result[fullKey] = {'previous': previousValue, 'current': currentValue};
    }
  }
  return result;
}
