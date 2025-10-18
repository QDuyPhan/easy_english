part of 'dictionary_bloc.dart';

@freezed
class DictionaryEvent with _$DictionaryEvent {
  const factory DictionaryEvent.getDictionary() = _GetDictionary;
  const factory DictionaryEvent.getWords({
    required String folder,
    required String topic,
  }) = _GetWords;
}
