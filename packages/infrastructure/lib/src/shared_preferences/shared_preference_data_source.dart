import 'package:internal_domain_model/internal_domain_model.dart';
import 'package:internal_infrastructure/internal_infrastructure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataSource {
  const SharedPreferenceDataSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  ThemeSetting getThemeSetting() {
    final themeIndex = _sharedPreferences.getInt(
      SharedPreferencesKeys.themeSetting.name,
    );
    return ThemeSetting.values.singleWhere(
      (themeSetting) => themeSetting.index == themeIndex,
      orElse: () => ThemeSetting.system,
    );
  }

  Future<void> saveThemeSetting(int themeIndex) async {
    await _sharedPreferences.setInt(
      SharedPreferencesKeys.themeSetting.name,
      themeIndex,
    );
  }
}
