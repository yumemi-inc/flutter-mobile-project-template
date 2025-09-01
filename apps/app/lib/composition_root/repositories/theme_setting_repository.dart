import 'package:flutter_app/composition_root/data_sources/shared_preference_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_infrastructure/theme_setting/theme_setting_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_setting_repository.g.dart';

@riverpod
ThemeSettingRepository themeSettingRepository(Ref ref) {
  final dataSource = ref.watch(sharedPreferenceDataSourceProvider);
  return ThemeSettingRepositoryImpl(dataSource);
}
