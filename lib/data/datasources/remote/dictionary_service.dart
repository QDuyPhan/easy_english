import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_english/core/config/networking/dio_client.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../models/dictionary/dictionary.dart';

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
      if (response.statusCode == 200) {
        return Right(response.data.map((e) => Dictionary.fromJson(e)).toList());
      } else {
        return Left(Failure.notFound(message: response.statusMessage ?? ''));
      }
    } on DioException catch (e) {
      return Left(Failure.network(message: 'Network error: $e'));
    }
  }
}
