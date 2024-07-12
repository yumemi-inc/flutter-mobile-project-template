import 'dart:convert';

import 'package:grinder/grinder.dart';

import '../model/melos_package.dart';

/// melos list --json の結果をパースして [MelosPackage] のリストを返す
List<MelosPackage> fetchMelosPackageList({
  void Function()? onFailure,
}) {
  final melosPackageListString = run(
    'melos',
    arguments: ['list', '--json'],
    quiet: true,
  );

  return (jsonDecode(melosPackageListString) as List<dynamic>)
      .map((e) => MelosPackage.fromJson(e as Map<String, dynamic>))
      .toList();
}
