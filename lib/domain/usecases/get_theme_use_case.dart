import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetThemeUseCase {
  final ThemeRepository themeRepository;

  const GetThemeUseCase({required this.themeRepository});

  Future<ThemeEntity> call() async {
    return await themeRepository.getTheme();
  }
}
