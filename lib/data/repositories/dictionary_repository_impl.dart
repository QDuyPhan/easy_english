import 'dart:convert';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/entities/dictionary_entity.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/failure.dart';
import '../../core/utils/assets.dart';
import '../../domain/repositories/dictionary_repository.dart';

@LazySingleton(as: DictionaryRepository)
class DictionaryRepositoryImpl implements DictionaryRepository {
  @override
  Future<Either<Failure, List<DictionaryEntity>>> getDictionary() async {
    try {
      final String path = Assets.jsonDictionary;
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonData = jsonDecode(jsonString);
      List<DictionaryEntity> list =
          jsonData.map((e) => DictionaryEntity.fromJson(e)).toList();
      if (list.isEmpty) {
        return Left(Failure.general(message: 'No dictionary found'));
      } else {
        return Right(list);
      }
    } catch (e) {
      app_config.printLog('e', 'Failed to get dictionary: $e');
      return Left(Failure.general(message: 'Failed to get dictionary'));
    }
  }

  @override
  Future<Either<Failure, List<WordEntity>>> getWords(
    String folder,
    String topic,
  ) async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/json/topics/$folder/$topic.json',
      );

      final List<WordEntity> list = await Isolate.run(() {
        final List<dynamic> jsonData = jsonDecode(jsonString);
        return jsonData.map((e) => WordEntity.fromJson(e)).toList();
      });

      if (list.isEmpty) {
        return Left(Failure.general(message: 'No words found'));
      } else {
        return Right(list);
      }
    } catch (e) {
      app_config.printLog("e", 'Failed to load words: $e');
      return Left(Failure.general(message: 'Failed to load words: $e'));
    }
  }
}
