import 'package:easy_english/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/theme_entity.dart';

@injectable
class SaveThemeUseCase {
  final ThemeRepository themeRepository;

  const SaveThemeUseCase({required this.themeRepository});

  Future<void> call(ThemeEntity theme) async {
    await themeRepository.saveTheme(theme);
  }
}
