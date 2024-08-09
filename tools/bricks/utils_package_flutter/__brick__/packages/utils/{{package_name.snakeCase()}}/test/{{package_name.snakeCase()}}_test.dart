import 'package:utils_{{package_name.snakeCase()}}/{{package_name.snakeCase()}}.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
