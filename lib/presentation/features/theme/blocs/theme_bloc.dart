import 'package:bloc/bloc.dart';
import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/domain/usecases/get_theme_use_case.dart';
import 'package:easy_english/domain/usecases/save_theme_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/theme_entity.dart';

part 'generated/theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase _getTheme;
  final SaveThemeUseCase _saveTheme;

  ThemeBloc({
    required GetThemeUseCase getTheme,
    required SaveThemeUseCase saveTheme,
  }) : _getTheme = getTheme,
       _saveTheme = saveTheme,
       super(const ThemeState.initial()) {
    on<ThemeEvent>((event, emit) async {
      event.map(
        getTheme: (event) => _handleGetTheme(event, emit),
        toggleTheme: (event) => _handleToggleTheme(event, emit),
      );
    });
  }

  _handleGetTheme(_GetTheme event, Emitter<ThemeState> emit) async {
    try {
      final getTheme = await _getTheme.call();
      app_config.printLog('i', 'Loaded theme: $getTheme');
      emit(state.copyWith(themeEntity: getTheme));
    } catch (e) {
      app_config.printLog('e', 'Error load theme: $e');
    }
  }

  _handleToggleTheme(_ToggleTheme event, Emitter<ThemeState> emit) async {
    try {
      if (state.themeEntity != null) {
        var newThemeType =
            state.themeEntity!.themeType == ThemeType.dark
                ? ThemeType.light
                : ThemeType.dark;
        var newThemeEntity = ThemeEntity(themeType: newThemeType);
        emit(state.copyWith(themeEntity: newThemeEntity));
      }
    } catch (e) {
      app_config.printLog('e', 'Error toggle theme: $e');
    }
  }
}
