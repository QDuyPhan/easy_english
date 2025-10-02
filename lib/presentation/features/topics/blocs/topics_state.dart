part of 'topics_bloc.dart';

@freezed
class TopicsState with _$TopicsState {
  const factory TopicsState.initial({@Default([]) List<WordEntity> words}) =
      _Initial;

  // const factory TopicsState.loading() = _Loading;
  //
  // const factory TopicsState.success({@Default([]) List<WordEntity> words}) =
  //     _Success;
  //
  // const factory TopicsState.error({required String message}) = _Error;
}
