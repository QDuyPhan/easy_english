import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class HeroKuRepository {
  Future<Either<Failure, List<String>>> fetchRandomWords(int number);
}
