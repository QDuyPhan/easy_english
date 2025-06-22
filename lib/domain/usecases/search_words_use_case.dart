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

    // Search in topics
    final topicFolders = [
      'animals',
      'appearance',
      'communication',
      'culture',
      'food_and_drink',
      'functions',
      'health',
      'homes_and_buildings',
      'leisure',
      'notions',
      'people',
      'politics_and_society',
      'science_and_technology',
      'sport',
      'the_natural_world',
      'time_and_space',
      'travel',
      'work_and_business',
    ];

    for (final folder in topicFolders) {
      try {
        final topics = _getTopicsForFolder(folder);
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

  List<String> _getTopicsForFolder(String folder) {
    switch (folder) {
      case 'animals':
        return ['animals', 'birds', 'fish_and_shellfish', 'insects_worms'];
      case 'appearance':
        return [
          'appearance',
          'body',
          'clothes_and_fashion',
          'colours_and_shapes',
        ];
      case 'communication':
        return ['language', 'phones_email_and_the_internet'];
      case 'culture':
        return [
          'art',
          'film_and_theatre',
          'literature_and_writing',
          'music',
          'tv_radio_and_news',
        ];
      case 'food_and_drink':
        return ['cooking_and_eating', 'drinks', 'food'];
      case 'functions':
        return [
          'discussion_and_agreement',
          'doubt_guessing_and_certainty',
          'opinion_and_argument',
          'permission_and_obligation',
          'preferences_and_decisions',
          'suggestions_and_advice',
        ];
      case 'health':
        return [
          'disability',
          'health_and_fitness',
          'health_problems',
          'healthcare',
          'mental_health',
        ];
      case 'homes_and_buildings':
        return ['buildings', 'gardens', 'houses_and_homes'];
      case 'leisure':
        return ['games_and_toys', 'hobbies', 'shopping'];
      case 'notions':
        return [
          'change_cause_and_effect',
          'danger',
          'difficulty_and_failure',
          'success',
        ];
      case 'people':
        return [
          'education',
          'family_and_relationships',
          'feelings',
          'life_stages',
          'personal_qualities',
        ];
      case 'politics_and_society':
        return [
          'crime_and_punishment',
          'law_and_justice',
          'people_in_society',
          'politics',
          'religion_and_festivals',
          'social_issues',
          'war_and_conflict',
        ];
      case 'science_and_technology':
        return [
          'biology',
          'computers',
          'engineering',
          'maths_and_measurement',
          'physics_and_chemistry',
          'scientific_research',
        ];
      case 'sport':
        return [
          'other_sports',
          'sports_ball_and_racket_sports',
          'water_sports',
        ];
      case 'the_natural_world':
        return [
          'farming',
          'geography',
          'plants_and_trees',
          'weather_and_climate',
        ];
      case 'time_and_space':
        return ['history', 'space', 'time'];
      case 'travel':
        return [
          'holidays',
          'transport_by_air',
          'transport_by_bus_and_train',
          'transport_by_road',
          'transport_by_water',
        ];
      case 'work_and_business':
        return ['business', 'jobs'];
      default:
        return [];
    }
  }
}
