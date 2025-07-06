import 'package:easy_english/domain/entities/sense_entity.dart';
import 'package:easy_english/domain/entities/word_status_entity.dart';

class WordEntity {
  final String word;
  final String pos;
  final String phonetic;
  final String phoneticText;
  final String phoneticAm;
  final String phoneticAmText;
  final List<SenseEntity> senses;
  final WordStatusEntity status;
  final int index;
  final String? userDefinition;

  WordEntity({
    required this.word,
    required this.pos,
    required this.phonetic,
    required this.phoneticText,
    required this.phoneticAm,
    required this.phoneticAmText,
    required this.senses,
    required this.status,
    required this.index,
    this.userDefinition,
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
    int? index,
    String? userDefinition,
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
      index: index ?? this.index,
      userDefinition: userDefinition ?? this.userDefinition,
    );
  }
}
