import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/mapper/app_mappr.dart';
import '../datasources/local/them_local.dart';
import '../models/theme.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocal themeLocal;

  ThemeRepositoryImpl({required this.themeLocal});

  @override
  Future<ThemeEntity> getTheme() async {
    final theme = await themeLocal.getTheme();
    return AppMappr().convert<Theme, ThemeEntity>(
      theme,
    ); // Map Theme to ThemeEntity
  }

  @override
  Future<void> saveTheme(ThemeEntity themeEntity) async {
    final theme = AppMappr().convert<ThemeEntity, Theme>(
      themeEntity,
    ); // Map ThemeEntity to Theme
    await themeLocal.saveTheme(theme);
  }
}
