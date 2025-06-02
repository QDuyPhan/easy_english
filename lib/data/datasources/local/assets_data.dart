import 'dart:convert';
import 'dart:isolate';

import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/config/hive_config.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract interface class AssetsData {
  Future<List<Word>> getOxfordWordsByLetter(String letter);

  Future<List<Word>> getAllOxfordWords();

  Future<List<Word>> getWordsByTopic(String folder, String topic);

  Future<List<Word>> readFromJsonTopic(String folder, String topic);
}

@LazySingleton(as: AssetsData)
class AssetsDataImpl implements AssetsData {
  final HiveConfig _hiveConfig;

  const AssetsDataImpl({required HiveConfig hiveConfig})
    : _hiveConfig = hiveConfig;

  static Future<List<Word>> _loadWordsInIsolate(String path) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => Word.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load words in isolate: $e');
    }
  }

  @override
  Future<List<Word>> getAllOxfordWords() async {
    try {
      final List<String> letters = 'abcdefghijklmnopqrstuvwxyz'.split('');
      final List<Future<List<Word>>> futures =
          letters.map((letter) {
            final path = 'assets/json/oxford_words/$letter.json';
            return rootBundle.loadString(path).then((jsonString) {
              return Isolate.run(() {
                final List<dynamic> jsonData = jsonDecode(jsonString);
                return jsonData.map((e) => Word.fromJson(e)).toList();
              });
            });
          }).toList();

      final List<List<Word>> results = await Future.wait(futures);
      return results.expand((words) => words).toList();
    } catch (e) {
      app_config.printLog('e', 'Failed to load words: $e');
      throw Exception('Failed to load words: $e');
    }
  }

  @override
  Future<List<Word>> getOxfordWordsByLetter(String letter) async {
    try {
      return await Isolate.run(
        () => _loadWordsInIsolate('assets/json/oxford_words/$letter.json'),
      );
    } catch (e) {
      app_config.printLog("e", 'Failed to load words: $e');
      throw Exception('Failed to load words: $e');
    }
  }

  @override
  Future<List<Word>> getWordsByTopic(String folder, String topic) async {
    try {
      return await Isolate.run(
        () => _loadWordsInIsolate('assets/json/topics/$folder/$topic.json'),
      );
    } catch (e) {
      app_config.printLog("e", 'Failed to load words: $e');
      throw Exception('Failed to load words: $e');
    }
  }

  @override
  Future<List<Word>> readFromJsonTopic(String folder, String topic) async {
    try {
      final path = 'assets/json/topics/$folder/$topic.json';
      final jsonString = await rootBundle.loadString(path);
      if (jsonString.isEmpty) {
        app_config.printLog('e', 'Empty JSON file at $path');
        return [];
      }
      return await Isolate.run(() async {
        final List<dynamic> jsonData = jsonDecode(jsonString);
        return jsonData.map((e) => Word.fromJson(e)).toList();
      });
    } catch (e) {
      app_config.printLog("e", 'Failed to load topic $folder/$topic: $e');
      throw Exception('Failed to load topic $folder/$topic: $e');
    }
  }
}
