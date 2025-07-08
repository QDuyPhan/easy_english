import 'package:easy_english/domain/entities/word_entity.dart';

abstract interface class VocabularyRepository {
  Future<List<WordEntity>> getDailyWords(List<WordEntity> words);
}
