// ignore_for_file: unreachable_from_main

import 'package:grinder/grinder.dart';

import 'gen_labels.dart';

Future<void> main(List<String> args) async => grind(args);

@Task()
Future<dynamic> test() async => TestRunner().testAsync();

@DefaultTask()
@Depends(test)
Future<void> build() async {
  Pub.build();
}

@Task('Generate package labels.')
void generatePackageLabels() => runGeneratePackageLabels();

@Task()
void clean() => defaultClean();
