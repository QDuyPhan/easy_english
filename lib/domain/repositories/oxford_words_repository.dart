import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/domain/entities/word_entity.dart';

abstract class OxfordWordsRepository {
  Future<void> initData();

  List<WordEntity> getAllOxfordWords();

  Future<Either<Failure, void>> saveWord(WordEntity word);
}
