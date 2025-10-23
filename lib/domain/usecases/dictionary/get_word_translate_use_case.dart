import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/repositories/words_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../di/injector.dart' as di;
import '../../entities/dictionary/dictionary_entity.dart';

@injectable
class GetWordTranslateUseCase {
  Future<Either<Failure, List<DictionaryEntity>>> execute(String word) async {
    return await di.getIt<WordsRepository>().getWordTranslate(word);
  }
}
