import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/repositories/dictionary_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failure.dart';
import '../../di/injector.dart' as di;
import '../entities/word_entity.dart';

@injectable
class GetWordFromTopicUseCase {
  Future<Either<Failure, List<WordEntity>>> call(
    String folder,
    String topic,
  ) async {
    return di.getIt<DictionaryRepository>().getWords(folder, topic);
  }
}
