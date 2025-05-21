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
}
