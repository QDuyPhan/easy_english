import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/entities/dictionary/dictionary_entity.dart';
import 'package:easy_english/domain/entities/words/word_entity.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/failure.dart';
import '../../core/mapper/dictionary/dictionary_mapper.dart';
import '../../core/mapper/words/word_mapper.dart';
import '../../core/utils/assets.dart';
import '../../domain/repositories/words_repository.dart';
import '../datasources/remote/dictionary_service.dart';
import '../datasources/remote/words_service.dart';
import '../models/dictionary/dictionary.dart';
import '../models/words/word.dart';

@LazySingleton(as: WordsRepository)
class WordsRepositoryImpl implements WordsRepository {
  @override
  Future<Either<Failure, WordEntity>> getWord(String word) async {
    try {
      Either<Failure, Word> result = await di.getIt<WordsService>().getWord(
        word,
      );
      return result.fold(
        (failure) => Left(failure),
        (word) => Right(WordMapper.toEntity(word)),
      );
    } catch (e) {
      app_config.printLog('e', 'Failed to get word: $e');
      return Left(Failure.network(message: 'Error: $e'));
    }
  }

  // @override
  // Future<Either<Failure, List<WordEntity>>> getListWord() async {
  //   try {
  //     List<String> words = Assets.vocabularyList;
  //     List<WordEntity> wordEntities = [];
  //
  //     for (String word in words) {
  //       final result = await di.getIt<WordsService>().getWord(word);
  //       result.fold(
  //         (failure) => Left(failure),
  //         (wordData) => wordEntities.add(WordMapper.toEntity(wordData)),
  //       );
  //     }
  //
  //     return Right(wordEntities);
  //   } catch (e) {
  //     app_config.printLog('e', 'Failed to get words: $e');
  //     return Left(Failure.network(message: 'Error: $e'));
  //   }
  // }
  @override
  Future<Either<Failure, List<WordEntity>>> getListWord() async {
    try {
      List<String> words = Assets.vocabularyList;
      List<WordEntity> wordEntities = [];

      for (String word in words) {
        try {
          final result = await di.getIt<WordsService>().getWord(word);

          result.fold(
            (failure) => app_config.printLog(
              'e',
              'Failed to get word: $word, error: ${failure.message}',
            ),
            (wordData) {
              wordEntities.add(WordMapper.toEntity(wordData));
            },
          );
        } catch (e) {
          app_config.printLog('e', 'Error occurred for word: $word, $e');
          continue;
        }
      }

      return Right(wordEntities);
    } catch (e) {
      app_config.printLog('e', 'Failed to get words: $e');
      return Left(Failure.network(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DictionaryEntity>>> getWordTranslate(
    String word,
  ) async {
    try {
      Either<Failure, List<Dictionary>> result = await di
          .getIt<DictionaryService>()
          .getWordTranslate(word);

      return result.fold(
        (failure) => Left(failure),
        (word) => Right(
          word.map((e) => DictionaryMapper.toDictionaryEntity(e)).toList(),
        ),
      );
    } catch (e) {
      app_config.printLog('e', 'Failed to get word: $e');
      return Left(Failure.network(message: 'Error: $e'));
    }
  }
}
