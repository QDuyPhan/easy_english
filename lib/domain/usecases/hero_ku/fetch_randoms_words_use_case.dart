import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../di/injector.dart' as di;
import '../../repositories/hero_ku_repository.dart';

@injectable
class FetchRandomsWordsUseCase {
  Future<Either<Failure, List<String>>> call(int number) async {
    return await di.getIt<HeroKuRepository>().fetchRandomWords(number);
  }
}
