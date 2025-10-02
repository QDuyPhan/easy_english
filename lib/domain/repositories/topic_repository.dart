import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/domain/entities/word_entity.dart';

abstract interface class TopicRepository {
  Future<void> initData();

  Future<Either<Failure, void>> saveTopic(
    String folder,
    String topic,
    WordEntity word,
  );

  Future<List<WordEntity>> getTopic(String folder, String topic);

  Future<Either<Failure, void>> saveWord(WordEntity word);

  Future<List<WordEntity>> getTopicFromJson(String folder, String topic);
}
