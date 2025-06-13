import 'dart:io';

enum OperatingSystem {
  ios,
  android;

  const OperatingSystem();

  factory OperatingSystem.platform() {
    final os = Platform.operatingSystem;

    return switch (os) {
      'ios' => ios,
      'android' => android,
      _ => throw UnimplementedError('Platform $os is not supported'),
    };
  }
}
