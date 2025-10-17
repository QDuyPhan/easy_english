import 'package:freezed_annotation/freezed_annotation.dart';

import 'grammar.dart';
import 'normalized_lemma.dart';

part 'generated/interpretation.freezed.dart';
part 'generated/interpretation.g.dart';

@freezed
class Interpretation with _$Interpretation {
  const factory Interpretation({
    @Default('') String lemma,
    @Default([]) List<NormalizedLemma> normalizedLemmas,
    @Default('') String partOfSpeech,
    @Default([]) List<Grammar> grammar,
  }) = _Interpretation;

  factory Interpretation.fromJson(Map<String, dynamic> json) =>
      _$InterpretationFromJson(json);
}
