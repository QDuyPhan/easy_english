import 'package:easy_english/data/models/words/pronunciation.dart';
import 'package:easy_english/data/models/words/results.dart';
import 'package:easy_english/data/models/words/syllables.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/word.freezed.dart';
part 'generated/word.g.dart';

@freezed
class Word with _$Word {
  const factory Word({
    @Default("") String? word,
    @Default([]) List<Results>? results,
    Syllables? syllables,
    Pronunciation? pronunciation,
    @Default(0.0) double? frequency,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}
