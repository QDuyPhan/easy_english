import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_english/core/config/networking/dio_client.dart';
import 'package:easy_english/data/models/dictionary/dictionary.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';

abstract class DictionaryService {
  Future<Either<Failure, List<Dictionary>>> getWordTranslate(String word);
}

@LazySingleton(as: DictionaryService)
class DictionaryServiceImpl implements DictionaryService {
  @override
  Future<Either<Failure, List<Dictionary>>> getWordTranslate(
    String word,
  ) async {
    try {
      final response = await di.getIt<DictionaryDio>().get('/$word');
      final rawData = response.data;
      if (response.statusCode == 200) {
        final list = (rawData as List<dynamic>)
            .map((e) => Dictionary.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(list);
      } else {
        return Left(Failure.notFound(message: response.statusMessage ?? ''));
      }
    } on DioException catch (e) {
      return Left(Failure.network(message: 'Network error: $e'));
    }
  }
}
