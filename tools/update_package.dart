import 'dart:convert';
import 'dart:io';
import 'model/package_info.dart';

Future<String?> main() async {
  final json = await Process.run('dart', ['pub', 'outdated', '--json']).then(
    (e) => jsonDecode(e.stdout),
  );

  final packageInfo = PackageInfo.fromJson(json);

  final shouldUpdatePkg = packageInfo.packages.where((pkg) {
    if (pkg.current != null && pkg.kind != Kind.transitive) {
      // 依存関係で追加されたパッケージ以外 && パッケージが最新以外の内容を取得
      return pkg.current!.compareTo(pkg.resolvable) != 0;
    }

    return false;
  });

  if (shouldUpdatePkg.isEmpty) {
    return null;
  }

  final rows = [
    '''
## Update package
| package | current | resolvable |
| :---    | :---    | :---       |
  '''
  ];

  for (final pkg in shouldUpdatePkg) {
    final row =
        '| ${pkg.package} | ${pkg.current?.version ?? 'null'} | ${pkg.resolvable.version} | \n';

    rows.add(row);
  }

  final jsonString = rows.join('').trim();
  stdout.writeln(jsonString);

  return jsonString;
}
