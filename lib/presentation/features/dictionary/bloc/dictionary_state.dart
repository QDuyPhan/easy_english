part of 'dictionary_bloc.dart';

@freezed
class DictionaryState with _$DictionaryState {
  const factory DictionaryState({
    @Default([]) List<DictionaryEntity> dictionary,
    @Default([]) List<WordEntity> words,
    @Default(false) bool isLoading,
    @Default('') String error,
    @Default('') String message,
  }) = _DictionaryState;
}
