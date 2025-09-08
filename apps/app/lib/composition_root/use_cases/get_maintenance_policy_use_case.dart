import 'package:flutter_app/composition_root/repositories/operational_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_application/operational_settings/get_maintenance_policy_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_maintenance_policy_use_case.g.dart';

@riverpod
GetMaintenancePolicyUseCase getMaintenancePolicyUseCase(Ref ref) =>
    GetMaintenancePolicyUseCase(
      operationalSettingsRepository: ref.watch(
        operationalSettingsRepositoryProvider,
      ),
    );
