import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/dictionary_entity.dart';

abstract interface class DictionaryRepository {
  Future<Either<Failure, List<DictionaryEntity>>> getDictionary();
}
