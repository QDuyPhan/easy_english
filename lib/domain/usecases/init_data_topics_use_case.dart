import 'package:easy_english/domain/repositories/topic_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InitDataTopicsUseCase {
  final TopicRepository _topicRepository;

  const InitDataTopicsUseCase(this._topicRepository);

  Future<void> execute() async {
    await _topicRepository.initData();
  }
}
