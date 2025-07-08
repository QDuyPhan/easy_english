import 'package:injectable/injectable.dart';

import '../../core/utils/assets.dart';
import '../entities/word_entity.dart';
import '../repositories/oxford_words_repository.dart';
import '../repositories/topic_repository.dart';
import '../repositories/vocabulary_repository.dart';

@injectable
class GetDailyWordsUseCase {
  final VocabularyRepository _vocabularyRepository;
  final OxfordWordsRepository _oxfordWordsRepository;
  final TopicRepository _topicRepository;

  const GetDailyWordsUseCase({
    required VocabularyRepository vocabularyRepository,
    required OxfordWordsRepository oxfordWordsRepository,
    required TopicRepository topicRepository,
  }) : _vocabularyRepository = vocabularyRepository,
       _oxfordWordsRepository = oxfordWordsRepository,
       _topicRepository = topicRepository;

  Future<List<WordEntity>> execute() async {
    final List<WordEntity> allWords = [];
    final oxfordWords = _oxfordWordsRepository.getAllOxfordWords();
    allWords.addAll(oxfordWords);

    for (final folder in Assets.topicFolders) {
      final topics = Assets.getTopicsForFolder(folder);
      for (final topic in topics) {
        final topicWords = _topicRepository.getTopic(folder, topic);
        allWords.addAll(topicWords);
      }
    }

    final dailyWords = await _vocabularyRepository.getDailyWords(allWords);

    return dailyWords;
  }
}
