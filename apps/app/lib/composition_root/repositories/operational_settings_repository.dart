import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_domain_logic/operational_settings/operational_settings_repository.dart';
import 'package:internal_infrastructure/operational_settings/operational_settings_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'operational_settings_repository.g.dart';

@riverpod
OperationalSettingsRepository operationalSettingsRepository(Ref ref) =>
    OperationalSettingsRepositoryImpl();
