import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';
import 'utils/path.dart';

/// Output the changes in pubspeck.lock in a table format.
Future<void> main(List<String> args) async {
  final yamlPath = args[0];

  final rootDir = fetchGitRootDirPath();
  final lockFile = File(join(rootDir, yamlPath));
  final currentYaml = loadYaml(lockFile.readAsStringSync());

  final mainLock = await Process.run('git', ['show', 'main:$yamlPath'])
      .then((value) => value.stdout);
  final mainYaml = loadYaml(mainLock);

  final compareValue = compareMap(mainYaml, currentYaml);

  final rows = [
    '''
  | Change | Diff |
  | :---   | :--- |
  '''
  ];
  for (final entry in compareValue.entries) {
    final row = '|' + entry.key + '|' + entry.value.toString() + '|' + '\n';
    rows.add(row);
  }

  if (rows.length == 1) {
    return;
  }
  stdout.writeln(rows.join('').trim());
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
