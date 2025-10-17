import 'package:freezed_annotation/freezed_annotation.dart';

import '../words/pronunciation.dart';
import 'interpretation.dart';
import 'lexeme.dart';
import 'license.dart';

part 'generated/entry.freezed.dart';
part 'generated/entry.g.dart';

@freezed
class Entry with _$Entry {
  const factory Entry({
    @Default('') String entry,
    @Default([]) List<Pronunciation> pronunciations,
    @Default([]) List<Interpretation> interpretations,
    @Default([]) List<Lexeme> lexemes,
    License? license,
    @Default([]) List<String> sourceUrls,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
