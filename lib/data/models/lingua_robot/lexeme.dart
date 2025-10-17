import 'package:freezed_annotation/freezed_annotation.dart';

import '../sense.dart';
import 'form.dart';

part 'generated/lexeme.freezed.dart';
part 'generated/lexeme.g.dart';

@freezed
class Lexeme with _$Lexeme {
  const factory Lexeme({
    @Default('') String lemma,
    @Default('') String partOfSpeech,
    @Default([]) List<Sense> senses,
    @Default([]) List<Form> forms,
  }) = _Lexeme;

  factory Lexeme.fromJson(Map<String, dynamic> json) => _$LexemeFromJson(json);
}
