import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/entities/dictionary_entity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/failure.dart';
import '../../core/mapper/app_mappr.dart';
import '../../core/utils/assets.dart';
import '../../domain/repositories/dictionary_repository.dart';

@LazySingleton(as: DictionaryRepository)
class DictionaryRepositoryImpl implements DictionaryRepository {
  final AppMappr _appMappr;

  const DictionaryRepositoryImpl({required AppMappr appMappr})
    : _appMappr = appMappr;

  @override
  Future<Either<Failure, List<DictionaryEntity>>> getDictionary() async {
    try {
      final String path = Assets.jsonDictionary;
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonData = jsonDecode(jsonString);
      List<DictionaryEntity> list =
          jsonData.map((e) => DictionaryEntity.fromJson(e)).toList();
      if (list.isEmpty) {
        return Left(Failure.general(message: 'No dictionary found'));
      } else {
        return Right(list);
      }
    } catch (e) {
      app_config.printLog('e', 'Failed to get dictionary: $e');
      return Left(Failure.general(message: 'Failed to get dictionary'));
    }
  }
}
