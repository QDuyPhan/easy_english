import 'dart:convert';

import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract interface class AssetsData {
  Future<List<Word>> getOxfordWordsByLetter(String letter);

  Future<List<Word>> getAllOxfordWords();
}

@LazySingleton(as: AssetsData)
class AssetsDataImpl implements AssetsData {
  @override
  Future<List<Word>> getAllOxfordWords() async {
    try {
      final List<String> letters = 'abcdefghijklmnopqrstuvwxyz'.split('');
      final List<Word> words = [];
      for (final letter in letters) {
        final List<Word> letterWords = await getOxfordWordsByLetter(letter);
        words.addAll(letterWords);
      }
      return words;
    } catch (e) {
      app_config.printLog("e", 'Failed to load words: $e');
      throw Exception('Failed to load words: $e');
    }
  }

  @override
  Future<List<Word>> getOxfordWordsByLetter(String letter) async {
    try {
      final path = 'assets/json/oxford_words/$letter.json';
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => Word.fromJson(e)).toList();
    } catch (e) {
      app_config.printLog("e", 'Failed to load words: $e');
      throw Exception('Failed to load words: $e');
    }
  }
}
