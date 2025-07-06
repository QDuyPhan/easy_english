part of 'topics_bloc.dart';

@freezed
class TopicsEvent with _$TopicsEvent {
  const factory TopicsEvent.getAllTopics({
    required String folder,
    required String topic,
  }) = _GetAllTopics;

  const factory TopicsEvent.saveWord({
    required WordEntity word,
    required WordStatusEntity wordStatus,
  }) = _SaveWord;
}
