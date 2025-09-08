import 'package:flutter_app/composition_root/repositories/operational_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_application/operational_settings/get_force_update_policy_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_force_update_policy_use_case.g.dart';

@riverpod
GetForceUpdatePolicyUseCase getForceUpdatePolicyUseCase(Ref ref) =>
    GetForceUpdatePolicyUseCase(
      operationalSettingsRepository: ref.watch(
        operationalSettingsRepositoryProvider,
      ),
    );
