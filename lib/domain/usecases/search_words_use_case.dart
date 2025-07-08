import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/oxford_words_repository.dart';
import 'package:easy_english/domain/repositories/topic_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchWordsUseCase {
  final OxfordWordsRepository _oxfordWordsRepository;
  final TopicRepository _topicRepository;

  const SearchWordsUseCase({
    required OxfordWordsRepository oxfordWordsRepository,
    required TopicRepository topicRepository,
  }) : _oxfordWordsRepository = oxfordWordsRepository,
       _topicRepository = topicRepository;

  List<WordEntity> execute(String query) {
    if (query.trim().isEmpty) {
      return [];
    }

    final searchQuery = query.toLowerCase().trim();
    final List<WordEntity> allResults = [];

    // Search in Oxford words
    final oxfordWords = _oxfordWordsRepository.getAllOxfordWords();
    final oxfordResults =
        oxfordWords.where((word) {
          return word.word.toLowerCase().contains(searchQuery);
        }).toList();

    allResults.addAll(oxfordResults);

    for (final folder in Assets.topicFolders) {
      try {
        final topics = Assets.getTopicsForFolder(folder);
        for (final topic in topics) {
          final topicWords = _topicRepository.getTopic(folder, topic);
          final topicResults =
              topicWords.where((word) {
                return word.word.toLowerCase().contains(searchQuery);
              }).toList();

          allResults.addAll(topicResults);
        }
      } catch (e) {
        // Skip if topic folder doesn't exist or has errors
        continue;
      }
    }

    // Remove duplicates based on word and definition
    final uniqueResults = <WordEntity>[];
    final seenWords = <String>{};

    for (final word in allResults) {
      final key = '${word.word}';
      if (!seenWords.contains(key)) {
        seenWords.add(key);
        uniqueResults.add(word);
      }
    }

    return uniqueResults;
  }
}
