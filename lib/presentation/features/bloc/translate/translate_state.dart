part of 'translate_bloc.dart';

@freezed
class TranslateState with _$TranslateState {
  const factory TranslateState({
    @Default(false) bool isLoading,
    @Default('') String error,
    @Default('') String message,
    @Default([]) List<DictionaryEntity> dictionaries,
  }) = _TranslateState;
}
