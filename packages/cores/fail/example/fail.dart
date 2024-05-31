import 'package:cores_fail/fail.dart';
import 'package:flutter/foundation.dart';

void main() {
  final awesome = Awesome();
  if (kDebugMode) {
    print('awesome: ${awesome.isAwesome}');
  }
}
