part of 'theme_bloc.dart';

enum ThemeStatus { initial, loading, success, error }

@freezed
class ThemeState with _$ThemeState {

  const factory ThemeState.initial({
    ThemeEntity? themeEntity,
  }) = _Initial;
}
