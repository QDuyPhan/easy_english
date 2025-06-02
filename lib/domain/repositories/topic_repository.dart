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

  List<WordEntity> getTopic(String folder, String topic);

  // List<WordEntity> getAllTopics();
  //
  // Future<Either<Failure, void>> saveWord(WordEntity word);
}
