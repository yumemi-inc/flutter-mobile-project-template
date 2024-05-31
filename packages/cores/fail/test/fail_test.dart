import 'package:cores_fail/fail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('Fail Test', () {
      expect(awesome.isAwesome, isFalse);
    });
  });
}
