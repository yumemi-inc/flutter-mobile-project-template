import 'package:flutter_app/composition_root/repositories/operational_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_application/operational_settings/check_force_update_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_force_update_use_case.g.dart';

@riverpod
CheckForceUpdateUseCase checkForceUpdateUseCase(Ref ref) =>
    CheckForceUpdateUseCase(
      operationalSettingsRepository: ref.watch(
        operationalSettingsRepositoryProvider,
      ),
    );
