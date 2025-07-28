import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/config/hive_config.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:injectable/injectable.dart';

abstract interface class LocalData {
  Future<void> saveWords(List<Word> words);

  List<Word> getWords();

  Future<void> saveWord(Word word);

  // Topics
  Future<void> saveVocabularyByTopic(
    String folder,
    String topic,
    List<Word> words,
  );

  List<Word>? getVocabularyByTopic(String folder, String topic);

  // Get Daily Words
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
      final jsonList = words.map((w) => w.toJson()).toList();
      await _hiveConfig.topicsBox.put('$folder/$topic', jsonList);
    } catch (e) {
      app_config.printLog('e', "❌ Error saving topic $folder/$topic: $e");
      throw Exception("Error saving topic $folder/$topic: $e");
    }
  }

  @override
  List<Word>? getVocabularyByTopic(String folder, String topic) {
    try {
      final raw = _hiveConfig.topicsBox.get('$folder/$topic');
      if (raw == null) return null;

      if (raw is! List) {
        app_config.printLog(
          'e',
          "❌ Invalid data format for topic $folder/$topic: expected List, got ${raw.runtimeType}",
        );
        return null;
      }

      return raw
          .map((e) {
            if (e is Map) {
              // Convert Map<dynamic, dynamic> to Map<String, dynamic> safely
              final Map<String, dynamic> jsonMap = {};
              e.forEach((key, value) {
                jsonMap[key.toString()] = value;
              });
              return Word.fromJson(jsonMap);
            } else {
              app_config.printLog(
                'e',
                "❌ Invalid item format in topic $folder/$topic: expected Map, got ${e.runtimeType}",
              );
              return null;
            }
          })
          .where((word) => word != null)
          .cast<Word>()
          .toList();
    } catch (e) {
      app_config.printLog('e', "❌ Error get topic $folder/$topic: $e");
      return null; // Return null instead of throwing exception
    }
  }

  @override
  List<Word> getAllTopicWords() {
    try {
      final List<Word> allWords = [];

      for (var entry in _hiveConfig.topicsBox.toMap().entries) {
        final value = entry.value;
        if (value is List) {
          for (var item in value) {
            try {
              if (item is Map) {
                final word = Word.fromJson(Map<String, dynamic>.from(item));
                allWords.add(word);
              } else {
                app_config.printLog(
                  'e',
                  '⚠️ Item trong topic ${entry.key} không phải là Map: $item',
                );
              }
            } catch (e) {
              app_config.printLog(
                'e',
                '❌ Lỗi parse item trong topic ${entry.key}: $e',
              );
            }
          }
        }
      }

      return allWords;
    } catch (e) {
      app_config.printLog('e', "❌ Error get all topic words: $e");
      throw Exception("Error get all topic words: $e");
    }
  }

  @override
  Future<List<Word>> getDailyWords(List<Word> words) async {
    final dailyWordsBox = _hiveConfig.dailyWordsBox;
    final today = DateTime.now().toIso8601String().substring(0, 10);

    // Clear old keys (giữ lại các key bắt đầu bằng hôm nay)
    for (var key in dailyWordsBox.keys) {
      if (!key.toString().startsWith(today)) {
        await dailyWordsBox.delete(key);
      }
    }

    // Nếu đã có đủ 5 từ hôm nay → trả về
    final existingWords =
        dailyWordsBox.keys
            .where((k) => k.toString().startsWith(today))
            .toList();

    if (existingWords.length == 5) {
      return existingWords.map((k) => dailyWordsBox.get(k)!).toList();
    }

    // Chọn từ mới
    final shuffled = [...words]..shuffle();
    final selected = shuffled.take(5).toList();

    for (int i = 0; i < selected.length; i++) {
      await dailyWordsBox.put('$today\_$i', selected[i]);
    }

    return selected;
  }
}
