import 'package:equatable/equatable.dart';

abstract class TopicsEvent extends Equatable {
  const TopicsEvent();

  @override
  List<Object> get props => [];
}

class GetTopic extends TopicsEvent {
  final String folder;
  final String topic;

  const GetTopic({required this.folder, required this.topic});

  @override
  List<Object> get props => [folder, topic];
}
