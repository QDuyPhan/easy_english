import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/topic_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTopicsUseCase {
  final TopicRepository _topicRepository;

  const GetTopicsUseCase(this._topicRepository);

  List<WordEntity> execute(String folder, String topic) {
    return _topicRepository.getTopic(folder, topic);
  }
}
