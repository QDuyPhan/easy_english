import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/assets.dart';
import '../repositories/oxford_words_repository.dart';
import '../repositories/topic_repository.dart';

@injectable
class SearchWordsUseCase {
  final OxfordWordsRepository _oxfordWordsRepository;
  final TopicRepository _topicRepository;

  const SearchWordsUseCase({
    required OxfordWordsRepository oxfordWordsRepository,
    required TopicRepository topicRepository,
  }) : _oxfordWordsRepository = oxfordWordsRepository,
       _topicRepository = topicRepository;

  Future<List<WordEntity>> execute(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    final searchQuery = query.toLowerCase().trim();
    final List<WordEntity> allResults = [];

    try {
      // Search in Oxford words first (priority)
      final oxfordWords = _oxfordWordsRepository.getAllOxfordWords();
      final oxfordResults = _searchInWords(oxfordWords, searchQuery);
      allResults.addAll(oxfordResults);

      // Search in topics
      for (final folder in Assets.topicFolders) {
        try {
          final topics = Assets.getTopicsForFolder(folder);
          for (final topic in topics) {
            final topicWords = await _topicRepository.getTopic(folder, topic);
            final topicResults = _searchInWords(topicWords, searchQuery);
            allResults.addAll(topicResults);
          }
        } catch (e) {
          // Skip if topic folder doesn't exist or has errors
          continue;
        }
      }

      // Remove duplicates and sort by relevance
      return _removeDuplicatesAndSort(allResults, searchQuery);
    } catch (e) {
      // Return empty list if any error occurs
      return [];
    }
  }

  /// Search words with improved matching
  List<WordEntity> _searchInWords(List<WordEntity> words, String searchQuery) {
    return words.where((word) {
      final wordLower = word.word.toLowerCase();

      // Exact match gets highest priority
      if (wordLower == searchQuery) return true;

      // Starts with search query
      if (wordLower.startsWith(searchQuery)) return true;

      // Contains search query
      if (wordLower.contains(searchQuery)) return true;

      // Search in definitions
      for (final sense in word.senses) {
        if (sense.definition.toLowerCase().contains(searchQuery)) {
          return true;
        }
      }

      return false;
    }).toList();
  }

  /// Remove duplicates and sort by relevance
  List<WordEntity> _removeDuplicatesAndSort(
    List<WordEntity> allResults,
    String searchQuery,
  ) {
    final uniqueResults = <WordEntity>[];
    final seenWords = <String>{};

    for (final word in allResults) {
      final key = word.word.toLowerCase();
      if (!seenWords.contains(key)) {
        seenWords.add(key);
        uniqueResults.add(word);
      }
    }

    // Sort by relevance: exact match > starts with > contains > definition match
    uniqueResults.sort((a, b) {
      final aWord = a.word.toLowerCase();
      final bWord = b.word.toLowerCase();

      // Exact match gets highest priority
      if (aWord == searchQuery && bWord != searchQuery) return -1;
      if (bWord == searchQuery && aWord != searchQuery) return 1;

      // Starts with gets second priority
      if (aWord.startsWith(searchQuery) && !bWord.startsWith(searchQuery))
        return -1;
      if (bWord.startsWith(searchQuery) && !aWord.startsWith(searchQuery))
        return 1;

      // Contains gets third priority
      if (aWord.contains(searchQuery) && !bWord.contains(searchQuery))
        return -1;
      if (bWord.contains(searchQuery) && !aWord.contains(searchQuery)) return 1;

      // Alphabetical order for same relevance
      return aWord.compareTo(bWord);
    });

    // Limit results to prevent performance issues
    return uniqueResults.take(100).toList();
  }
}
