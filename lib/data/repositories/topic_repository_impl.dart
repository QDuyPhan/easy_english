import 'dart:convert';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/core/mapper/app_mappr.dart';
import 'package:easy_english/data/datasources/local/assets_data.dart';
import 'package:easy_english/data/datasources/local/local_data.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/topic_repository.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';

@LazySingleton(as: TopicRepository)
class TopicRepositoryImpl implements TopicRepository {
  final AssetsData _assetsData;

  // final HiveConfig _hiveConfig;
  final LocalData _localData;
  final AppMappr _appMappr;

  TopicRepositoryImpl({
    required AssetsData assetsData,
    // required HiveConfig hiveConfig,
    required LocalData localData,
    required AppMappr appMappr,
  }) : _assetsData = assetsData,
       // _hiveConfig = hiveConfig,
       _localData = localData,
       _appMappr = appMappr;

  static Future<List<Word>> _loadWordsInIsolate(String path) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => Word.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load words in isolate: $e');
    }
  }

  @override
  Future<Either<Failure, void>> saveTopic(
    String folder,
    String topic,
    WordEntity word,
  ) async {
    try {
      final model = _appMappr.convert<WordEntity, Word>(word);
      await _localData.saveVocabularyByTopic(folder, topic, [model]);
      return Right(null);
    } catch (e) {
      return Left(Failure.general(message: 'Failed to save word'));
    }
  }

  @override
  Future<List<WordEntity>> getTopic(String folder, String topic) async {
    try {
      final topicWords = _localData.getAllTopicWords();
      if (topicWords.isEmpty) {
        app_config.printLog('w', 'Topic $folder/$topic is empty');
        return [];
      }
      return topicWords
          .map((word) => _appMappr.convert<Word, WordEntity>(word))
          .toList();
    } catch (e) {
      app_config.printLog('e', 'Failed to get topic $folder/$topic: $e');
      return [];
    }
  }

  @override
  Future<Either<Failure, void>> saveWord(WordEntity word) async {
    try {
      final model = _appMappr.convert<WordEntity, Word>(word);
      await _localData.saveWord(model);
      return Right(null);
    } catch (e) {
      return Left(Failure.general(message: 'Failed to save word'));
    }
  }

  // Future<void> clearAllTopicsData() async {
  //   try {
  //     await _hiveConfig.topicsBox.clear();
  //     app_config.printLog('i', 'All topics data cleared');
  //   } catch (e) {
  //     app_config.printLog('e', 'Failed to clear topics data: $e');
  //   }
  // }

  @override
  Future<List<WordEntity>> getTopicFromJson(String folder, String topic) async {
    final path = 'assets/json/topics/$folder/$topic.json';
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = jsonDecode(jsonString);
    List<WordEntity> words =
        jsonData.map((e) => WordEntity.fromJson(e)).toList();
    app_config.printLog('i', 'getTopicFromJson ${words.length}');
    return await Isolate.run(() {
      return words;
    });
  }
}
