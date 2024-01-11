import 'package:flutter_app/util/model/force_update_status.dart';
import 'package:flutter_app/util/provider/force_update_version_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_provider.g.dart';

@Riverpod(keepAlive: true)
ForceUpdateStatus forceUpdate(ForceUpdateRef ref) {
  final forceUpdateVersionState = ref.watch(forceUpdateVersionProvider);
  final enabled = ref.state.shouldForceUpdate(
    forceUpdateTargetVersion: forceUpdateVersionState,
  );
  
  return ForceUpdateStatus(
    enabled: enabled,
  );
}
