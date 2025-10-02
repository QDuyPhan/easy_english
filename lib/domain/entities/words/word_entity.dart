import 'package:easy_english/data/models/words/pronunciation.dart';
import 'package:easy_english/data/models/words/results.dart';
import 'package:easy_english/data/models/words/syllables.dart';

class WordEntity {
  final String? word;
  final List<Results>? results;
  final Syllables? syllables;
  final Pronunciation? pronunciation;
  final double? frequency;

  WordEntity({
    this.word,
    this.results,
    this.syllables,
    this.pronunciation,
    this.frequency,
  });

  WordEntity copyWith({
    String? word,
    List<Results>? results,
    Syllables? syllables,
    Pronunciation? pronunciation,
    double? frequency,
  }) {
    return WordEntity(
      word: word ?? this.word,
      results: results ?? this.results,
      syllables: syllables ?? this.syllables,
      pronunciation: pronunciation ?? this.pronunciation,
      frequency: frequency ?? this.frequency,
    );
  }

  factory WordEntity.fromJson(Map<String, dynamic> json) {
    return WordEntity(
      word: json['word'],
      results:
          json['results'] != null
              ? List<Results>.from(
                json['results'].map((x) => Results.fromJson(x)).toList(),
              )
              : [],
      syllables:
          json['syllables'] != null
              ? Syllables.fromJson(json['syllables'])
              : null,
      pronunciation:
          json['pronunciation'] != null
              ? Pronunciation.fromJson(json['pronunciation'])
              : null,
      frequency: (json['frequency'] ?? 0.0).toDouble(),
    );
  }
}
