import 'package:dartz/dartz.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/entities/words/word_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../repositories/words_repository.dart';

@injectable
class GetWordUseCase {
  Future<Either<Failure, WordEntity>> call(String word) async {
    return di.getIt<WordsRepository>().getWord(word);
  }
}
