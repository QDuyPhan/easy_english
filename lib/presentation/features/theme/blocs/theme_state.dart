part of 'theme_bloc.dart';

enum ThemeStatus { initial, loading, success, error }

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeStatus status,
    String? errorMessage,
    ThemeEntity? themeEntity,
  }) = _ThemeState;

  const factory ThemeState.initial() = _Initial;
}
