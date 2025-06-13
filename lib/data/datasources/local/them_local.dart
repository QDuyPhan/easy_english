import 'package:easy_english/data/models/theme.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/theme_entity.dart';

abstract interface class ThemeLocal {
  Future<void> saveTheme(Theme theme);

  Future<Theme> getTheme();
}

@LazySingleton(as: ThemeLocal)
class ThemeLocalImpl implements ThemeLocal {
  final SharedPreferences _prefs;
  static const String _themeKey = 'theme_key';

  ThemeLocalImpl({required SharedPreferences sharedPreferences})
    : _prefs = sharedPreferences;

  @override
  Future<void> saveTheme(Theme theme) async {
    var themeValue = theme.themeType == ThemeType.dark ? 'dark' : 'light';
    await _prefs.setString(_themeKey, themeValue);
  }

  @override
  Future<Theme> getTheme() async {
    final themeValue = _prefs.getString(_themeKey);
    if (themeValue == 'dark') {
      return Theme(themeType: ThemeType.dark);
    }
    return Theme(themeType: ThemeType.light);
  }
}
