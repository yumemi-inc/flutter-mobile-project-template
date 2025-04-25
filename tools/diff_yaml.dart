import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';
import 'utils/path.dart';

extension YamlMapToJson on YamlMap {
  Map<String, dynamic> toJson() {
    final jsonString = jsonEncode(this);
    return jsonDecode(jsonString);
  }
}

Future<void> main(List<String> args) async {
  final yamlPath = args[0];
  final lockPath = args[1];

  final rootDir = fetchGitRootDirPath();

  final yamlFile = File(join(rootDir, yamlPath));
  final currentYaml = loadYaml(yamlFile.readAsStringSync()) as YamlMap;
  final lockFile = File(join(rootDir, lockPath));
  final currentLock = loadYaml(lockFile.readAsStringSync()) as YamlMap;

  final compareValue = await diffLockContent(lockPath, currentLock);

  final rows = [];

  if (compareValue.isNotEmpty) {
    rows.add('''
## pubspec.lock has been changed

| Change | Diff |
| :---   | :--- |
''');

    for (final entry in compareValue.entries) {
      final row = '|' + entry.key + '|' + entry.value.toString() + '|' + '\n';
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
          '| ${diff['package']} | ${diff['pubspec.yaml']} | ${diff['pubspec.lock']} | \n';
      rows.add(row);
    }
  }

  stdout.writeln(rows.join('').trim());
}

/// 実行ブランチとorigin/mainのpubspec.lockの内容を比較し、表記が異なるものを返す
Future<Map<String, dynamic>> diffLockContent(String path, YamlMap lock) async {
  final exitCode = await Process.run('git', ['fetch', 'origin', 'main'])
      .then((e) => e.exitCode);
  if (exitCode != 0) {
    throw Exception('Failed to execute git fetch origin main');
  }

  final (success, error) =
      await Process.run('git', ['show', 'origin/main:$path'])
          .then((value) => (value.stdout as String, value.stderr as String));

  if (error.isNotEmpty) {
    throw Exception('Failed to execute git show main:$path / $stderr');
  }
  final mainLock = loadYaml(success);

  return compareMap(mainLock, lock);
}

/// pubspec.yamlとpubspec.lockの内容を参照し、versionの表記が異なるものを返す
Iterable<Map<String, dynamic>> diffPkgVersion(
  YamlMap yaml,
  YamlMap lock,
) {
  final yamlJson = yaml.toJson();

  final pkgYaml = <String, dynamic>{}
    ..addAll(yamlJson['dev_dependencies'])
    ..addAll(yamlJson['dependency_overrides'])
    ..addAll(yamlJson['melos']['command']['bootstrap']['dependencies'])
    ..addAll(yamlJson['melos']['command']['bootstrap']['dev_dependencies']);
  final lockPackages = Map<String, dynamic>.from(lock['packages']);

  return lockPackages.entries.where((lockPkg) {
    final name = lockPkg.key;

    if (pkgYaml.containsKey(name)) {
      final yamlVersion = pkgYaml[name].replaceFirst('^', '');
      final lockVersion = lockPkg.value['version'].toString();

      return yamlVersion != lockVersion;
    }

    return false;
  }).map((e) => {
        "package": e.key,
        "pubspec.yaml": pkgYaml[e.key],
        "pubspec.lock": e.value['version']
      });
}

/// Compares [Maps] and returns a [Map<String, dynami>] of the elements that differ between [previous] and [current].
Map<String, dynamic> compareMap(
  Map previous,
  Map current, [
  String prefix = '',
]) {
  final result = <String, dynamic>{};

  final allKeys = {...previous.keys, ...current.keys};

  for (final key in allKeys) {
    final fullKey = prefix.isEmpty ? '$key' : '$prefix.$key';
    final previousValue = previous[key];
    final currentValue = current[key];

    if (previousValue is Map || currentValue is Map) {
      final childDiff =
          compareMap(previousValue ?? {}, currentValue ?? {}, fullKey);
      if (childDiff.isNotEmpty) result.addAll(childDiff);
    } else if (previousValue != currentValue) {
      result[fullKey] = {'previous': previousValue, 'current': currentValue};
    }
  }
  return result;
}
