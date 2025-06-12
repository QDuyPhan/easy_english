part of 'topics_bloc.dart';

@freezed
class TopicsState with _$TopicsState {
  const factory TopicsState.initial({@Default([]) List<WordEntity> words}) =
      _Initial;
}
