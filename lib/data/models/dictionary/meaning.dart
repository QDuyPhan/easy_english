import 'package:freezed_annotation/freezed_annotation.dart';

import 'definition.dart';

part 'generated/meaning.freezed.dart';

part 'generated/meaning.g.dart';
@freezed
class Meaning with _$Meaning {
  const factory Meaning({
     String? partOfSpeech,
      List<Definition>? definitions,
     List<String>? synonyms,
     List<String>? antonyms,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);
}