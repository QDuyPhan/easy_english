import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/entities/word_entity.dart';

import '../../core/errors/failure.dart';
import '../entities/dictionary_entity.dart';

abstract interface class DictionaryRepository {
  Future<Either<Failure, List<DictionaryEntity>>> getDictionary();

  Future<Either<Failure, List<WordEntity>>> getWords(
    String folder,
    String topic,
  );
}
