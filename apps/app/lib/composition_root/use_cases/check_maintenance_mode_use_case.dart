import 'package:flutter_app/composition_root/repositories/operational_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_application/internal_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_maintenance_mode_use_case.g.dart';

@riverpod
CheckMaintenanceModeUseCase checkMaintenanceModeUseCase(Ref ref) =>
    CheckMaintenanceModeUseCase(
      operationalSettingsRepository: ref.watch(
        operationalSettingsRepositoryProvider,
      ),
    );
