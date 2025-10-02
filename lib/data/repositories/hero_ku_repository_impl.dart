import 'package:dartz/dartz.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/repositories/hero_ku_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/failure.dart';
import '../datasources/remote/hero_ku_service.dart';

@LazySingleton(as: HeroKuRepository)
class HeroKuRepositoryImpl implements HeroKuRepository {
  @override
  Future<Either<Failure, List<String>>> fetchRandomWords(int number) async {
    try {
      Either<Failure, List<String>> result = await di
          .getIt<HeroKuService>()
          .fetchRandomWords(number);
      return result.fold((failure) => Left(failure), (word) => Right(word));
    } catch (e) {
      app_config.printLog('e', 'Failed to get word: $e');
      return Left(Failure.network(message: 'Error: $e'));
    }
  }
}
