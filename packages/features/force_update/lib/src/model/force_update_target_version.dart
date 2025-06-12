import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'force_update_target_version.freezed.dart';

@freezed
abstract class ForceUpdateTargetVersion with _$ForceUpdateTargetVersion {
  const factory ForceUpdateTargetVersion({
    required Version ios,
    required Version android,
  }) = _ForceUpdateTargetVersion;

  const ForceUpdateTargetVersion._();

  Version? get defaultTargetPlatformVersion {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,
      _ => null,
    };
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Version?>(
        'defaultTargetPlatformVersion',
        defaultTargetPlatformVersion,
      ),
    );
  }
}
