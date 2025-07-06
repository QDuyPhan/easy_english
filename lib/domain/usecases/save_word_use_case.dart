import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failure.dart';
import '../entities/word_entity.dart';
import '../repositories/topic_repository.dart';

@injectable
class SaveWordUseCase {
  final TopicRepository _topicRepository;

  const SaveWordUseCase(this._topicRepository);

  Future<Either<Failure, void>> execute(WordEntity word) async {
    return await _topicRepository.saveWord(word);
  }
}
