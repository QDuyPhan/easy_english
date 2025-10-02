import 'package:injectable/injectable.dart';

import '../entities/word_entity.dart';
import '../repositories/topic_repository.dart';

@injectable
class GetTopicFromJsonUseCase {
  final TopicRepository _topicRepository;

  const GetTopicFromJsonUseCase(this._topicRepository);

  Future<List<WordEntity>> execute(String folder, String topic) async {
    return await _topicRepository.getTopicFromJson(folder, topic);
  }
}
