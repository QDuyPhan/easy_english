import 'package:dartz/dartz.dart';
import 'package:easy_english/core/config/hive_config.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/core/mapper/app_mappr.dart';
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

  // @override
  // List<WordEntity> getAllTopics() {
  //   // final wordsModel = _localData.getTopics();
  //   return wordsModel
  //       .map((word) => _appMappr.convert<Word, WordEntity>(word))
  //       .toList();
  // }

  @override
  Future<void> initData() async {
    try {
      final List<Word> animalsTopic =
          await _assetsData.readFromJsonAnimalsTopic();
      await _localData.saveAnimalsTopics('animals', animalsTopic);
    } catch (e) {
      app_config.printLog('e', 'Failed to init data: $e');
      throw Exception('Failed to init data: $e');
    }
  }

  @override
  Future<Either<Failure, void>> saveAnimalsTopic(WordEntity word) async {
    try {
      final model = _appMappr.convert<WordEntity, Word>(word);
      await _localData.saveAnimalsTopics('animals', model as List<Word>);
      return Right(null);
    } catch (e) {
      return Left(Failure.general(message: 'Failed to save word'));
    }
  }

  @override
  List<WordEntity> getAnimalsTopic() {
    try {
      final animalsTopic = _localData.getAnimalsTopics('animals')!;
      if (animalsTopic.isEmpty) {
        app_config.printLog('e', 'Animals topic is empty');
      }
      return animalsTopic
          .map((word) => _appMappr.convert<Word, WordEntity>(word))
          .toList();
    } catch (e) {
      app_config.printLog('e', 'Failed to init data: $e');
      throw Exception('Failed to init data: $e');
    }
  }

  // @override
  // Future<Either<Failure, void>> saveWord(WordEntity word) {
  //   // TODO: implement saveWord
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, void>> saveWord(WordEntity word) async {
  //   try {
  //     final model = _appMappr.convert<WordEntity, Word>(word);
  //     await _localData.saveTopic(model);
  //     return Right(null);
  //   } catch (e) {
  //     return Left(Failure.general(message: 'Failed to save word'));
  //   }
  // }
}
