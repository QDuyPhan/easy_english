import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/data/models/word.dart';

abstract class OxfordWordsRepository {
  Future<void> initData();

  List<Word> getAllOxfordWords();

  Future<Either<Failure, void>> saveWord(Word word);
}
