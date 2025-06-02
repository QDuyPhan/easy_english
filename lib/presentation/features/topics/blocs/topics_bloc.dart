import 'package:bloc/bloc.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_event.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../domain/usecases/get_topics_usecase.dart';

@injectable
class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final GetTopicsUsecase _getAllTopics;

  TopicsBloc({required GetTopicsUsecase getAllTopics})
    : _getAllTopics = getAllTopics,
      super(TopicsInitial()) {
    on<GetTopic>(_handleGetTopic);
  }

  _handleGetTopic(GetTopic event, Emitter<TopicsState> emit) {
    try {
      emit(const TopicsLoading());
      final words = _getAllTopics.execute(event.folder, event.topic);
      app_config.printLog('i', "${words.map((e) => e.word).toList()}");
      emit(TopicsLoaded(words));
    } catch (e) {
      app_config.printLog('e', e.toString());
      emit(
        TopicsError('Failed to get topic ${event.folder}/${event.topic}: $e'),
      );
    }
  }
}
