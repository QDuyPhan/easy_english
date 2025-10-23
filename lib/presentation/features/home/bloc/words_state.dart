part of 'words_bloc.dart';

// @freezed
// class WordsState with _$WordsState {
//   const factory WordsState.initial() = _Initial;
//   const factory WordsState.loading() = _Loading;
//   const factory WordsState.success(WordEntity word) = _Success;
//   const factory WordsState.error(String message) = _Error;
// }

@freezed
class WordsState with _$WordsState {
  const factory WordsState({
    @Default([]) List<String> words,
    @Default(false) bool isLoading,
    @Default('') String error,
    @Default('') String message,
    @Default(null) String? word,
    @Default(20) int pageSize,
    @Default(1) int page,
    @Default([]) List<DictionaryEntity> dictionaries,
  }) = _WordsState;
}
