import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_infrastructure/internal_infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'operational_settings_repository.g.dart';

@riverpod
OperationalSettingsRepository operationalSettingsRepository(Ref ref) =>
    OperationalSettingsRepositoryImpl();
