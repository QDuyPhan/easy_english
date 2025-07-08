import 'package:injectable/injectable.dart';

import '../../core/mapper/app_mappr.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/vocabulary_repository.dart';
import '../datasources/local/local_data.dart';
import '../models/word.dart';

@LazySingleton(as: VocabularyRepository)
class VocabularyRepositoryImpl implements VocabularyRepository {
  final LocalData _localData;
  final AppMappr _appMappr;

  const VocabularyRepositoryImpl({
    required LocalData localData,
    required AppMappr appMappr,
  }) : _localData = localData,
       _appMappr = appMappr;

  @override
  Future<List<WordEntity>> getDailyWords(List<WordEntity> words) async {
    // 1. Convert List<WordEntity> -> List<Word>
    final wordModels = _appMappr.convertList<WordEntity, Word>(words);

    // 2. Gọi localData (trả về List<Word>)
    final dailyWordModels = await _localData.getDailyWords(wordModels);

    // 3. Convert List<Word> -> List<WordEntity>
    final dailyWordEntities = _appMappr.convertList<Word, WordEntity>(
      dailyWordModels,
    );

    return dailyWordEntities;
  }
}
