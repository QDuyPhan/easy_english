import 'package:easy_english/domain/entities/words/word_entity.dart';

import '../../../data/models/words/word.dart';

class WordMapper {
  static WordEntity toEntity(Word word) {
    return WordEntity(
      word: word.word ?? "",
      results: word.results ?? [],
      syllables: word.syllables,
      pronunciation: word.pronunciation,
      frequency: word.frequency ?? 0.0,
    );
  }

  static Word toModel(WordEntity wordEntity) {
    return Word(
      word: wordEntity.word,
      results: wordEntity.results,
      syllables: wordEntity.syllables,
      pronunciation: wordEntity.pronunciation,
      frequency: wordEntity.frequency,
    );
  }
}
