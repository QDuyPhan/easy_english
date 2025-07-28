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
      // Kiểm tra xem dữ liệu topics đã được lưu chưa
      if (_isTopicsDataInitialized()) {
        app_config.printLog(
          'i',
          'Topics data already initialized, skipping...',
        );
        return;
      }

      app_config.printLog('i', 'Initializing topics data...');
      final listTopic = Assets.listTopic;
      for (var key in listTopic.keys) {
        final folder = key;
        final topics = listTopic[key]!;

        for (var topic in topics) {
          final list = await _assetsData.readFromJsonTopic(
            folder.toLowerCase(),
            topic.toLowerCase(),
          );
          await _localData.saveVocabularyByTopic(
            folder.toLowerCase(),
            topic.toLowerCase(),
            list,
          );
        }
      }
      app_config.printLog('i', 'Topics data initialization completed');
    } catch (e) {
      app_config.printLog('e', 'Failed to init data: $e');
      throw Exception('Failed to init data: $e');
    }
  }

  /// Kiểm tra xem dữ liệu topics đã được khởi tạo chưa
  bool _isTopicsDataInitialized() {
    try {
      final listTopic = Assets.listTopic;
      int totalTopics = 0;
      int initializedTopics = 0;
      int errorTopics = 0;

      for (var key in listTopic.keys) {
        final folder = key;
        final topics = listTopic[key]!;
        totalTopics += topics.length;

        for (var topic in topics) {
          try {
            final existingData = _localData.getVocabularyByTopic(
              folder.toLowerCase(),
              topic.toLowerCase(),
            );
            if (existingData != null && existingData.isNotEmpty) {
              initializedTopics++;
            }
          } catch (e) {
            errorTopics++;
            app_config.printLog('w', 'Error checking topic $folder/$topic: $e');
          }
        }
      }

      // Nếu ít nhất 80% topics đã được khởi tạo thì coi như đã hoàn thành
      final validTopics = totalTopics - errorTopics;
      if (validTopics == 0) {
        app_config.printLog('w', 'No valid topics found, will reinitialize');
        return false;
      }

      final initializationPercentage = (initializedTopics / validTopics) * 100;
      app_config.printLog(
        'i',
        'Topics initialization: $initializedTopics/$validTopics (${initializationPercentage.toStringAsFixed(1)}%) - Errors: $errorTopics',
      );

      return initializationPercentage >= 80;
    } catch (e) {
      app_config.printLog('e', 'Error checking topics initialization: $e');
      return false;
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
  List<WordEntity> getTopic(String folder, String topic) {
    try {
      final topicWords = _localData.getVocabularyByTopic(folder, topic);
      if (topicWords == null || topicWords.isEmpty) {
        app_config.printLog('w', 'Topic $folder/$topic is empty');
        return [];
      }
      return topicWords
          .map((word) => _appMappr.convert<Word, WordEntity>(word))
          .toList();
    } catch (e) {
      app_config.printLog('e', 'Failed to get topic $folder/$topic: $e');
      return []; // Return empty list instead of throwing exception
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

  /// Xóa tất cả dữ liệu topics (dùng để reset khi cần)
  Future<void> clearAllTopicsData() async {
    try {
      await _hiveConfig.topicsBox.clear();
      app_config.printLog('i', 'All topics data cleared');
    } catch (e) {
      app_config.printLog('e', 'Failed to clear topics data: $e');
    }
  }
}
