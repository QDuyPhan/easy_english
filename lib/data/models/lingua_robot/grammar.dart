import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/grammar.freezed.dart';
part 'generated/grammar.g.dart';

@freezed
class Grammar with _$Grammar {
  const factory Grammar({
    @Default([]) List<String> number,
    @Default([]) List<String> grammarCase,
    @Default([]) List<String> person,
    @Default([]) List<String> verbForm,
    @Default([]) List<String> tense,
    @Default([]) List<String> mood,
  }) = _Grammar;

  factory Grammar.fromJson(Map<String, dynamic> json) =>
      _$GrammarFromJson(json);
}
