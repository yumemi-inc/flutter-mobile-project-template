import 'package:flutter_test/flutter_test.dart';
import 'package:internal_design_ui/src/internal_design_ui_base.dart';

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
