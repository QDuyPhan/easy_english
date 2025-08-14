import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/config/hive_config.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:injectable/injectable.dart';

abstract interface class LocalData {
  Future<void> saveWords(List<Word> words);

  List<Word> getWords();

  Future<void> saveWord(Word word);

  Future<void> saveVocabularyByTopic(
    String folder,
    String topic,
    List<Word> words,
  );

  Future<List<Word>> getDailyWords(List<Word> words);

  List<Word> getAllTopicWords();
}

@LazySingleton(as: LocalData)
class LocalDataImpl implements LocalData {
  final HiveConfig _hiveConfig;

  LocalDataImpl({required HiveConfig hiveConfig}) : _hiveConfig = hiveConfig;

  @override
  List<Word> getWords() {
    try {
      return _hiveConfig.wordsBox.values.toList();
    } catch (e) {
      app_config.printLog('e', "Error get words: $e");
      throw Exception("Error get words: $e");
    }
  }

  @override
  Future<void> saveWord(Word word) {
    return _hiveConfig.wordsBox.put(word.index, word);
  }

  @override
  Future<void> saveWords(List<Word> words) async {
    try {
      await _hiveConfig.wordsBox.putAll(
        Map.fromEntries(words.map((word) => MapEntry(word.index, word))),
      );
    } catch (e) {
      app_config.printLog('e', "Error saving words: $e");
      throw Exception("Error saving words: $e");
    }
  }

  @override
  Future<void> saveVocabularyByTopic(
    String folder,
    String topic,
    List<Word> words,
  ) async {
    try {
      words.forEach((word) async {
        await _hiveConfig.topicsBox.put('$folder/$topic', word);
      });
    } catch (e) {
      app_config.printLog('e', "❌ Error saving topic $folder/$topic: $e");
      throw Exception("Error saving topic $folder/$topic: $e");
    }
  }

  @override
  List<Word> getAllTopicWords() {
    try {
      return _hiveConfig.topicsBox.values.toList();
    } catch (e) {
      app_config.printLog('e', "Error get words: $e");
      throw Exception("Error get words: $e");
    }
  }

  @override
  Future<List<Word>> getDailyWords(List<Word> words) async {
    final dailyWordsBox = _hiveConfig.dailyWordsBox;
    final today = DateTime.now().toIso8601String().substring(0, 10);

    for (var key in dailyWordsBox.keys) {
      if (!key.toString().startsWith(today)) {
        await dailyWordsBox.delete(key);
      }
    }

    final existingWords =
        dailyWordsBox.keys
            .where((k) => k.toString().startsWith(today))
            .toList();

    if (existingWords.length == 5) {
      return existingWords.map((k) => dailyWordsBox.get(k)!).toList();
    }

    final shuffled = [...words]..shuffle();
    final selected = shuffled.take(5).toList();

    for (int i = 0; i < selected.length; i++) {
      await dailyWordsBox.put('$today\_$i', selected[i]);
    }

    return selected;
  }
}
