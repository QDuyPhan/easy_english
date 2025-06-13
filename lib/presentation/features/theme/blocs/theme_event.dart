part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.getTheme() = _GetTheme;

  const factory ThemeEvent.toggleTheme() = _ToggleTheme;
}
