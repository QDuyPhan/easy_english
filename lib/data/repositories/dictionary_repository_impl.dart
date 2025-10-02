import 'dart:convert';

import 'package:easy_english/domain/entities/dictionary_entity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/mapper/app_mappr.dart';
import '../../core/utils/assets.dart';
import '../../domain/repositories/dictionary_repository.dart';

@LazySingleton(as: DictionaryRepository)
class DictionaryRepositoryImpl implements DictionaryRepository {
  final AppMappr _appMappr;

  const DictionaryRepositoryImpl({required AppMappr appMappr})
    : _appMappr = appMappr;

  @override
  Future<List<DictionaryEntity>> getDictionary() async {
    final String path = Assets.jsonDictionary;
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = jsonDecode(jsonString);
    List<DictionaryEntity> list =
        jsonData.map((e) => DictionaryEntity.fromJson(e)).toList();
    return list;
  }
}
