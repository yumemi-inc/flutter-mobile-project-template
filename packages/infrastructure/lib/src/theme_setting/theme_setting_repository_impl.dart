import 'package:internal_domain_logic/internal_domain_logic.dart';
import 'package:internal_domain_model/internal_domain_model.dart';
import 'package:internal_infrastructure/src/shared_preferences/shared_preference_data_source.dart';

class ThemeSettingRepositoryImpl implements ThemeSettingRepository {
  const ThemeSettingRepositoryImpl(this._sharedPreference);

  final SharedPreferenceDataSource _sharedPreference;

  @override
  ThemeSetting getThemeSetting() {
    return _sharedPreference.getThemeSetting();
  }

  @override
  Future<void> saveThemeSetting(ThemeSetting themeSetting) async {
    await _sharedPreference.saveThemeSetting(themeSetting.index);
  }
}
