import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/entities/words/word_entity.dart';

import '../../core/errors/failure.dart';

abstract class WordsRepository {
  Future<Either<Failure, WordEntity>> getWord(String word);

  Future<Either<Failure, List<WordEntity>>> getListWord();
}
