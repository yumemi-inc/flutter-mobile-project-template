import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;

  _renameFiles(featureName: featureName);
  _addFeatureDependency(featureName: featureName);
  _addL10n(featureName: featureName);

  Process.runSync(
    'melos',
    ['bs'],
  );
  Process.runSync(
    'melos',
    ['run', 'regenerate_by_using_gen_l10n'],
  );
}

/// ファイル名を適切なものに変更
_renameFiles({
  required String featureName,
}) {
  // ARB 関連
  final arbDirPath = 'packages/features/$featureName/lib/src/l10n';
  final enArbFilePath = '$arbDirPath/features_${featureName}_en.arb';
  final jaArbFilePath = '$arbDirPath/features_${featureName}_ja.arb';
  File('$enArbFilePath.tmp').renameSync(enArbFilePath);
  File('$jaArbFilePath.tmp').renameSync(jaArbFilePath);
}

/// appにfeatureの依存を追加
void _addFeatureDependency({
  required String featureName,
}) {
  Process.runSync(
    'dart',
    [
      'pub',
      'add',
      // Dartバージョンが上がったらこっちの書き方に変更する
      // https://dart.dev/tools/pub/cmd/pub-add#path-1
      // '\'features_$featureName:{"path":"../../packages/features/$featureName"}\'',
      'features_$featureName',
      '--path',
      '../../packages/features/$featureName',
    ],
    workingDirectory: 'apps/app',
  );
}

/// appのmain.dartにl10nのimportなどを追加
void _addL10n({
  required String featureName,
}) {
  // main.dartファイルのパス
  String filePath = 'apps/app/lib/main.dart';

  // main.dartファイルを読み込み
  String fileContent = File(filePath).readAsStringSync();

  // 最初の行に追加するimport文
  String importStatement =
      "import 'package:features_$featureName/l10n.dart';\n";

  // 追加するコード
  String newLocalizationsDelegates = '''
        ...${featureName.pascalCase}L10n.localizationsDelegates,
  ''';
  String newSupportedLocales = '''
        ...${featureName.pascalCase}L10n.supportedLocales,
  ''';

  // import文を最初に追加
  fileContent = importStatement + fileContent;

  // localizationsDelegatesに追加
  fileContent = fileContent.replaceFirst(
    'localizationsDelegates: const [',
    'localizationsDelegates: const [\n$newLocalizationsDelegates',
  );

  // supportedLocalesに追加
  fileContent = fileContent.replaceFirst(
    'supportedLocales: const [',
    'supportedLocales: const [\n$newSupportedLocales',
  );

  // main.dartファイルを再度書き込み
  File(filePath).writeAsStringSync(fileContent);

  // フォーマット
  Process.runSync('dart', ['format', filePath]);
}
