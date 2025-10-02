part of 'dictionary_bloc.dart';

@freezed
class DictionaryState with _$DictionaryState {
  const factory DictionaryState.initial({
    @Default([]) List<DictionaryEntity> dictionary,
  }) = _DictionaryState;
}
