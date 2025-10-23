import 'package:freezed_annotation/freezed_annotation.dart';

import 'definition.dart';

part 'generated/meaning.freezed.dart';

part 'generated/meaning.g.dart';
@freezed
class Meaning with _$Meaning {
  const factory Meaning({
    @Default('') String partOfSpeech,
    @Default([])  List<Definition> definitions,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);
}