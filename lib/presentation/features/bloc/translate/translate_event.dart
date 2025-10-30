part of 'translate_bloc.dart';

@freezed
class TranslateEvent with _$TranslateEvent {
  const factory TranslateEvent.translateWord(String word) = _TranslateWord;
}
