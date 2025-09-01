import 'package:internal_domain_model/theme_setting.dart';

abstract class ThemeSettingRepository {
  ThemeSetting getThemeSetting();
  Future<void> saveThemeSetting(ThemeSetting themeSetting);
}
