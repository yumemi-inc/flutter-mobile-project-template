import 'package:flutter_app/composition_root/data_sources/shared_preference_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_infrastructure/internal_infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_repository.g.dart';

@riverpod
ThemeModeRepository themeModeRepository(Ref ref) {
  final dataSource = ref.watch(sharedPreferenceDataSourceProvider);
  return ThemeModeRepositoryImpl(dataSource);
}
