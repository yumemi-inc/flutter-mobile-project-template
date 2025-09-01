import 'package:internal_domain_model/internal_domain_model.dart';

abstract class ThemeSettingRepository {
  ThemeSetting getThemeSetting();
  Future<void> saveThemeSetting(ThemeSetting themeSetting);
}
