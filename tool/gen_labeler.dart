// ignore_for_file: unreachable_from_main
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:path/path.dart';
import 'package:yaml_edit/yaml_edit.dart';

import 'model/melos_package.dart';
import 'utils/constants.dart';
import 'utils/label.dart';
import 'utils/melos.dart';
import 'utils/path.dart';

/**
 * `.github/labeler.yml` のパッケージ部分を生成する
 */
void runGeneratePackageLabeler() {
  final rootDir = fetchGitRootDirPath();
  final labelerFile = File(join(rootDir, '.github', 'labeler.yml'));
  if (!labelerFile.existsSync()) {
    fail(
      [
        'Required files not found.',
        'Create `.github/labeler.yml` and run it again.',
      ].join('\n'),
    );
  }

  // コメント行を保持しつつ新しいYAML内容に置き換える
  labelerFile.writeAsStringSync(
    [
      _resolvePreGeneratedContent(
        labelsContentLines: labelerFile.readAsLinesSync(),
      ),
      _generateLabelerContent(
        rootDir: rootDir,
        melosPackageList: fetchMelosPackageList(),
      ),
      // NOTE: 末尾に改行を追加するために空文字を追加
      '',
    ].join('\n'),
  );

  log('Labels updated successfully.');
}

/**
 * 自動生成より前の手動生成部分を解決する
 */
String _resolvePreGeneratedContent({
  required List<String> labelsContentLines,
}) {
  final autoGeneratedIndex = resolveAutoGeneratedIndex(
    contentLines: labelsContentLines,
  );

  // 自動生成以前のテキストのみ取得する
  return labelsContentLines.sublist(0, autoGeneratedIndex).join('\n');
}

/**
 * Melos で管理しているパッケージから自動生成
 */
String _generateLabelerContent({
  required String rootDir,
  required List<MelosPackage> melosPackageList,
}) {
  // Melos で管理しているパッケージを labels 配下の要素に追加
  final melosPackageLabelersYamlEditor = YamlEditor('labels:')
    ..update(
      ['labels'],
      melosPackageList.generatePackageLabelers(rootDir: rootDir),
    );

  final melosPackageLabelersString = melosPackageLabelersYamlEditor.toString();

  // NOTE: 視認性向上のため YAML 要素間に改行を加える
  final formattedGeneratContent = <String>['  $autoGeneratedLabelComment'];
  for (final line in melosPackageLabelersString.split('\n')) {
    if (line.startsWith('labels:')) {
      continue;
    }
    if (line.startsWith('  -') && formattedGeneratContent.length != 1) {
      formattedGeneratContent.add('');
    }
    formattedGeneratContent.add(line.replaceAll(r'\/', '/'));
  }

  return formattedGeneratContent.join('\n');
}

extension on List<MelosPackage> {
  /**
   * labeler 要素の一覧を生成する
   */
  List<Map<String, dynamic>> generatePackageLabelers({
    required String rootDir,
  }) {
    final generatedLabels = <Map<String, dynamic>>[];
    for (final package in this) {
      final path = package.location.replaceAll('$rootDir/', '');
      final label = '@$path';

      final newLabel = <String, dynamic>{
        'label': label,
        'files': <String>[
          '$path/.+',
        ],
      };

      generatedLabels.add(newLabel);
    }
    return generatedLabels;
  }
}
