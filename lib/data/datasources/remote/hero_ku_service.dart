import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_english/core/config/networking/dio_client.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../di/injector.dart' as di;

abstract class HeroKuService {
  Future<Either<Failure, List<String>>> fetchRandomWords(int number);
}

@LazySingleton(as: HeroKuService)
class HeroKuServiceImpl implements HeroKuService {
  @override
  Future<Either<Failure, List<String>>> fetchRandomWords(int number) async {
    try {
      final response = await di.getIt<HeroKuDio>().get(
        '/word?number=${number.toString()}',
      );

      if (response.statusCode == 200) {
        List<String> words = List<String>.from(response.data);
        return Right(words);
      } else {
        return Left(Failure.notFound(message: 'Word not found'));
      }
    } on DioException catch (e) {
      return Left(Failure.network(message: 'Network error: $e'));
    }
  }
}
