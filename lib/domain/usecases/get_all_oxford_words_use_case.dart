import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failure.dart';
import '../../di/injector.dart' as di;
import '../repositories/oxford_words_repository.dart';

@injectable
class GetAllOxfordWordsUseCase {
  Future<Either<Failure, List<WordEntity>>> execute() async {
    return await di.getIt<OxfordWordsRepository>().getAllOxfordWords();
  }
}
