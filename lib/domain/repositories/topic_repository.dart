import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/domain/entities/word_entity.dart';

abstract interface class TopicRepository {
  Future<void> initData();

  Future<Either<Failure, void>> saveAnimalsTopic(WordEntity word);

  List<WordEntity> getAnimalsTopic();

  // List<WordEntity> getAllTopics();
  //
  // Future<Either<Failure, void>> saveWord(WordEntity word);
}
