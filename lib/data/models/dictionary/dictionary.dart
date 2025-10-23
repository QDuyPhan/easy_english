import 'package:easy_english/data/models/dictionary/phonetic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'license.dart';
import 'meaning.dart';

part 'generated/dictionary.freezed.dart';

part 'generated/dictionary.g.dart';

@freezed
class Dictionary with _$Dictionary {
  const factory Dictionary({
    String? word,
    String? phonetic,
    List<Phonetic>? phonetics,
    List<Meaning>? meanings,
    License? license,
    List<String>? sourceUrls,
  }) = _Dictionary;

  factory Dictionary.fromJson(Map<String, dynamic> json) =>
      _$DictionaryFromJson(json);
}
