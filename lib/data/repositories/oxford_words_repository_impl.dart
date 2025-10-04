import 'dart:convert';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/oxford_words_repository.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';

@LazySingleton(as: OxfordWordsRepository)
class OxfordWordsRepositoryImpl implements OxfordWordsRepository {
  @override
  Future<Either<Failure, List<WordEntity>>> getAllOxfordWords() async {
    try {
      final List<String> letters = 'abcdefghijklmnopqrstuvwxyz'.split('');
      final List<Future<List<WordEntity>>> futures =
          letters.map((letter) {
            final path = 'assets/json/oxford_words/$letter.json';
            return rootBundle.loadString(path).then((jsonString) {
              return Isolate.run(() {
                final List<dynamic> jsonData = jsonDecode(jsonString);
                return jsonData.map((e) => WordEntity.fromJson(e)).toList();
              });
            });
          }).toList();

      final List<List<WordEntity>> results = await Future.wait(futures);
      if (results.isEmpty) {
        return Left(Failure.general(message: 'No words found'));
      } else {
        return Right(results.expand((words) => words).toList());
      }
    } catch (e) {
      app_config.printLog('e', 'Failed to load words: $e');
      return Left(Failure.general(message: 'Failed to load words'));
    }
  }

  @override
  Future<Either<Failure, void>> saveWord(WordEntity word) async {
    try {
      // final model = _appMappr.convert<WordEntity, Word>(word);
      // await _localData.saveWord(model);
      return Right(null);
    } catch (e) {
      return Left(Failure.general(message: 'Failed to save word'));
    }
  }
}
