import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:injectable/injectable.dart';

import '../../models/scheduled_notification.dart';

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

  Future<void> saveScheduledNotification(
    ScheduledNotification scheduledNotification,
  );

  Future<void> removeScheduledNotification(int id);

  List<ScheduledNotification> getScheduledNotifications();
}

@LazySingleton(as: LocalData)
class LocalDataImpl implements LocalData {
  // final HiveConfig _hiveConfig;

  LocalDataImpl();

  @override
  List<Word> getWords() {
    try {
      // return _hiveConfig.wordsBox.values.toList();
      return [];
    } catch (e) {
      app_config.printLog('e', "Error get words: $e");
      throw Exception("Error get words: $e");
    }
  }

  @override
  Future<void> saveWord(Word word) {
    // return _hiveConfig.wordsBox.put(word.index, word);
    throw Exception("Error saving word: $word");
  }

  @override
  Future<void> saveWords(List<Word> words) async {
    try {
      // await _hiveConfig.wordsBox.putAll(
      //   Map.fromEntries(words.map((word) => MapEntry(word.index, word))),
      // );
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
      // words.forEach((word) async {
      //   await _hiveConfig.topicsBox.put('$folder/$topic', word);
      // });
    } catch (e) {
      app_config.printLog('e', "❌ Error saving topic $folder/$topic: $e");
      throw Exception("Error saving topic $folder/$topic: $e");
    }
  }

  @override
  List<Word> getAllTopicWords() {
    try {
      // return _hiveConfig.topicsBox.values.toList();
      return [];
    } catch (e) {
      app_config.printLog('e', "Error get words: $e");
      throw Exception("Error get words: $e");
    }
  }

  @override
  Future<List<Word>> getDailyWords(List<Word> words) async {
    // final dailyWordsBox = _hiveConfig.dailyWordsBox;
    // final today = DateTime.now().toIso8601String().substring(0, 10);
    //
    // for (var key in dailyWordsBox.keys) {
    //   if (!key.toString().startsWith(today)) {
    //     await dailyWordsBox.delete(key);
    //   }
    // }
    //
    // final existingWords = dailyWordsBox.keys
    //     .where((k) => k.toString().startsWith(today))
    //     .toList();
    //
    // if (existingWords.length == 5) {
    //   return existingWords.map((k) => dailyWordsBox.get(k)!).toList();
    // }
    //
    // final shuffled = [...words]..shuffle();
    // final selected = shuffled.take(5).toList();
    //
    // for (int i = 0; i < selected.length; i++) {
    //   await dailyWordsBox.put('$today\_$i', selected[i]);
    // }

    // return selected;
    return [];
  }

  @override
  List<ScheduledNotification> getScheduledNotifications() {
    // return _hiveConfig.scheduledNotificationBox.values.toList();
    return [];
  }

  @override
  Future<void> saveScheduledNotification(
    ScheduledNotification scheduledNotification,
  ) {
    // return _hiveConfig.scheduledNotificationBox.put(
    //   scheduledNotification.id,
    //   scheduledNotification,
    // );
    throw Exception(
      "Error saving scheduled notification: $scheduledNotification",
    );
  }

  @override
  Future<void> removeScheduledNotification(int id) {
    // return _hiveConfig.scheduledNotificationBox.delete(id);
    throw Exception("Error removing scheduled notification: $id");
  }
}
