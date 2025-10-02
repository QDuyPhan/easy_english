import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_english/core/config/networking/dio_client.dart';
import 'package:easy_english/data/models/words/word.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';

abstract class WordsService {
  Future<Either<Failure, Word>> getWord(String word);
}

@LazySingleton(as: WordsService)
class WordsServiceImpl implements WordsService {
  @override
  Future<Either<Failure, Word>> getWord(String word) async {
    try {
      final response = await di.getIt<WordsDio>().get('/words/$word');
      if (response.statusCode == 200) {
        return Right(Word.fromJson(response.data));
      } else {
        return Left(Failure.notFound(message: 'Word not found'));
      }
    } on DioException catch (e) {
      return Left(Failure.network(message: 'Network error: $e'));
    }
  }
}
