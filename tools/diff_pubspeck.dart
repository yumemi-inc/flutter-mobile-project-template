import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';
import 'model/package_info.dart';
import 'utils/path.dart';

extension YamlMapToJson on YamlMap {
  Map<String, dynamic> toJson() {
    final jsonString = jsonEncode(this);
    return jsonDecode(jsonString);
  }
}

extension ExtMapEntity on MapEntry {
  MapEntry? firstWhereOrNullEntry(String key) {
    final reuslt =
        Map<String, dynamic>.from(value).entries.where((e) => e.key == key);

    if (reuslt.isEmpty) {
      return null;
    }

    return reuslt.first;
  }
}

void main(List<String> args) async {
  // TODO  argsからここの値は抜き取るように修正する
  const pubspeckLockFile = 'pubspec.lock';
  const pubspeckYamlPath = 'pubspec.yaml';

  final changedShas = await findSha256InGitDiff(filePath: pubspeckLockFile);

  final rootDir = fetchGitRootDirPath();

  final lockFile = File(join(rootDir, pubspeckLockFile));
  final lockFileJson =
      (loadYaml(lockFile.readAsStringSync()) as YamlMap).toJson();
  final packages = Map.from(lockFileJson['packages']);
  final changePackageInfoFromPubspeckLock = packages.values.where((value) {
    final description = value['description'];
    if (description is! Map) {
      return false;
    }

    final sha256 = description['sha256'];
    return changedShas.contains(sha256);
  }).map(
    (package) => PackageInfo(
      name: package['description']['name'],
      version: package['version'],
    ),
  );

  final yamlFile = File(join(rootDir, pubspeckYamlPath));
  final targets = [
    'dev_dependencies',
    'dependency_overrides',
    'melos.command.bootstrap.dependencies',
    'melos.command.bootstrap.dev_dependencies'
  ];

  final currentPackageInfoFromPubspeckYaml =
      getPubspeckYamlInfoAll(yaml: yamlFile, targets: targets);

  final edited = changePackageInfoFromPubspeckLock
      .where((pkg) => !currentPackageInfoFromPubspeckYaml.contains(pkg));

  for (final pkg in edited) {
    print(pkg.name);
  }
}

Iterable<PackageInfo> getPubspeckYamlInfoAll({
  required File yaml,
  required List<String> targets,
}) {
  MapEntry getNestedValue(MapEntry value, List<String> keys) {
    if (keys.isEmpty) {
      return value;
    }

    final key = keys.removeAt(0);
    final entry = value.firstWhereOrNullEntry(key);
    if (entry == null) {
      return value;
    }

    return getNestedValue(entry, keys);
  }

  final result = <Map<String, dynamic>>[];

  final json = (loadYaml(yaml.readAsStringSync()) as YamlMap).toJson();

  for (final pubspeckYaml in json.entries) {
    // ネスト構造かつ最初のkeyが一致しちいるか判定する
    final isNestedKey = targets.any((e) {
      final split = e.split('.');
      if (2 > split.length) {
        return false;
      }

      return split.first == pubspeckYaml.key;
    });

    if (isNestedKey) {
      // ネストされているkeyを取得する
      final nestedKeys = targets
          .where((e) => e.contains(pubspeckYaml.key))
          .map((e) => e.split('.')..remove(pubspeckYaml.key));

      for (final key in nestedKeys) {
        final entry = getNestedValue(pubspeckYaml, key);
        result.add(entry.value);
      }
    } else if (targets.contains(pubspeckYaml.key)) {
      result.add(pubspeckYaml.value);
    }
  }

  return result
      .fold<Map<String, dynamic>>({}, (k, v) {
        k.addAll(v);
        return k;
      })
      .entries
      .map(
        (e) => PackageInfo(
          name: e.key,
          version: e.value,
        ),
      );
}

/// [git diff]の実行結果から[sha256]のみ[Iterable]で返す
Future<Iterable<String>> findSha256InGitDiff({
  String baseBranch = 'origin/main',
  String? targetBranch,
  required String filePath,
}) async {
  await Process.run('git', ['fetch', ...baseBranch.split('/')]);

  final (String mainSha, String currentSha) = await (
    Process.run('git', [
      'log',
      baseBranch,
      "-n",
      "1",
      "--pretty=format:'%H'",
      "--",
      filePath
    ]).then((log) => log.stdout.toString().replaceAll("'", "")),
    Process.run('git', [
      "log",
      if (targetBranch != null) targetBranch,
      "--pretty=format:'%H'",
      "-1",
      filePath,
    ]).then((log) => log.stdout.toString().replaceAll("'", ""))
  ).wait;

  final diff = await Process.run('git', [
    'diff',
    '$mainSha..$currentSha',
    '--',
    filePath,
  ]).then((log) => log.stdout);

  // diffから「sha256」という文字列が含まれた行を取得し、値を切り取る
  final regex = RegExp(r'sha256:\s*"?([a-fA-F0-9]{64})"?');
  final matches = regex.allMatches(diff);
  return matches.map((match) => match.group(1)).whereType<String>();
}
