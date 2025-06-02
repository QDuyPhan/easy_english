import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/core/mapper/app_mappr.dart';
import 'package:easy_english/data/datasources/local/assets_data.dart';
import 'package:easy_english/data/datasources/local/local_data.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/oxford_words_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OxfordWordsRepository)
class OxfordWordsRepositoryImpl implements OxfordWordsRepository {
  final AssetsData _assetsData;
  final LocalData _localData;
  final AppMappr _appMappr;

  const OxfordWordsRepositoryImpl({
    required AssetsData assetsData,
    required LocalData localData,
    required AppMappr appMappr,
  }) : _assetsData = assetsData,
       _localData = localData,
       _appMappr = appMappr;

  @override
  List<WordEntity> getAllOxfordWords() {
    final wordsModel = _localData.getWords();
    return wordsModel
        .map((word) => _appMappr.convert<Word, WordEntity>(word))
        .toList();
  }

  @override
  Future<void> initData() async {
    try {
      final currentWords = _localData.getWords();
      if (currentWords.isNotEmpty) return;
      final words =
          (await _assetsData.getAllOxfordWords())
              .mapIndexed((index, word) => word.copyWith(index: index + 1))
              .toList();
      app_config.printLog('i', "${words.map((e) => e.word).toList()}");
      await _localData.saveWords(words);
    } catch (e) {
      app_config.printLog('e', 'Failed to init data: $e');
      throw Exception('Failed to init data: $e');
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
