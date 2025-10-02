import 'package:easy_english/domain/entities/sense_entity.dart';
import 'package:easy_english/domain/entities/word_status_entity.dart';

class WordEntity {
  final String word;
  final String pos;
  final String phonetic;
  final String? phoneticText;
  final String? phoneticAm;
  final String? phoneticAmText;
  final List<SenseEntity> senses;
  final WordStatusEntity status;
  final String id;

  WordEntity({
    required this.word,
    required this.pos,
    required this.phonetic,
    this.phoneticText,
    this.phoneticAm,
    this.phoneticAmText,
    required this.senses,
    required this.status,
    required this.id,
  });

  WordEntity copyWith({
    String? word,
    String? pos,
    String? phonetic,
    String? phoneticText,
    String? phoneticAm,
    String? phoneticAmText,
    List<SenseEntity>? senses,
    WordStatusEntity? status,
    String? id,
  }) {
    return WordEntity(
      word: word ?? this.word,
      pos: pos ?? this.pos,
      phonetic: phonetic ?? this.phonetic,
      phoneticText: phoneticText ?? this.phoneticText,
      phoneticAm: phoneticAm ?? this.phoneticAm,
      phoneticAmText: phoneticAmText ?? this.phoneticAmText,
      senses: senses ?? this.senses,
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }

  factory WordEntity.fromJson(Map<String, dynamic> json) {
    return WordEntity(
      word: json['word'],
      pos: json['pos'],
      phonetic: json['phonetic'],
      phoneticText: json['phonetic_text'],
      phoneticAm: json['phonetic_am'],
      phoneticAmText: json['phonetic_am_text'],
      senses:
          json['senses'] != null
              ? List<SenseEntity>.from(
                json['senses'].map((x) => SenseEntity.fromJson(x)).toList(),
              )
              : [],
      status: WordStatusEntity.fromJson(json['status']),
      id: json['id'],
    );
  }
}
