import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failure.dart';
import '../../di/injector.dart' as di;
import '../entities/dictionary_entity.dart';
import '../repositories/dictionary_repository.dart';

@injectable
class GetDictionaryUseCase {
  Future<Either<Failure, List<DictionaryEntity>>> execute() async {
    return await di.getIt<DictionaryRepository>().getDictionary();
  }
}
