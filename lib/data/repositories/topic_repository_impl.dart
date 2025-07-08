import 'package:dartz/dartz.dart';
import 'package:easy_english/core/config/hive_config.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/core/mapper/app_mappr.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/data/datasources/local/assets_data.dart';
import 'package:easy_english/data/datasources/local/local_data.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/topic_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';

@LazySingleton(as: TopicRepository)
class TopicRepositoryImpl implements TopicRepository {
  final AssetsData _assetsData;
  final HiveConfig _hiveConfig;
  final LocalData _localData;
  final AppMappr _appMappr;

  TopicRepositoryImpl({
    required AssetsData assetsData,
    required HiveConfig hiveConfig,
    required LocalData localData,
    required AppMappr appMappr,
  }) : _assetsData = assetsData,
       _hiveConfig = hiveConfig,
       _localData = localData,
       _appMappr = appMappr;

  @override
  Future<void> initData() async {
    try {
      final listTopic = Assets.listTopic;
      listTopic.forEach((key, value) async {
        final folder = key;
        for (var topic in value) {
          final List<Word> list = await _assetsData.readFromJsonTopic(
            folder.toLowerCase(),
            topic.toLowerCase(),
          );
          await _localData.saveVocabularyByTopic(
            folder.toLowerCase(),
            topic.toLowerCase(),
            list,
          );
        }
      });
    } catch (e) {
      app_config.printLog('e', 'Failed to init data: $e');
      throw Exception('Failed to init data: $e');
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
      await _localData.saveVocabularyByTopic(folder, topic, model as List<Word>);
      return Right(null);
    } catch (e) {
      return Left(Failure.general(message: 'Failed to save word'));
    }
  }

  @override
  List<WordEntity> getTopic(String folder, String topic) {
    try {
      final topicWords = _localData.getVocabularyByTopic(folder, topic);
      if (topicWords == null || topicWords.isEmpty) {
        app_config.printLog('e', 'Topic $folder/$topic is empty');
        return [];
      }
      return topicWords
          .map((word) => _appMappr.convert<Word, WordEntity>(word))
          .toList();
    } catch (e) {
      app_config.printLog('e', 'Failed to get topic $folder/$topic: $e');
      throw Exception('Failed to get topic $folder/$topic: $e');
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
}
