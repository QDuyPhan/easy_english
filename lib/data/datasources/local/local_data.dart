import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/config/hive_config.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:injectable/injectable.dart';

abstract interface class LocalData {
  Future<void> saveWords(List<Word> words);

  List<Word> getWords();

  Future<void> saveWord(Word word);
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
}
