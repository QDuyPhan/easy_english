import 'package:easy_english/domain/entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<ThemeEntity> getTheme();
  Future<void> saveTheme(ThemeEntity themeEntity);
}
