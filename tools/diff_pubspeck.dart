import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';
import 'utils/path.dart';

/// args
///   0: [pubspeck.lock] file path
Future<void> main(List<String> args) async {
  final pubspeckLockPath = args[0];

  final rootDir = fetchGitRootDirPath();
  final lockFile = File(join(rootDir, pubspeckLockPath));
  final currentYaml = loadYaml(lockFile.readAsStringSync());

  final mainLock = await Process.run('git', ['show', 'main:$pubspeckLockPath'])
      .then((value) => value.stdout);
  final mainYaml = loadYaml(mainLock);

  final compareValue = compareMap(mainYaml, currentYaml);

  stdout.writeln(jsonEncode(compareValue));
}

/// [Map]を比較し、[previous]と[current]で異なる要素を[Map<String, dynami>]返す
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
