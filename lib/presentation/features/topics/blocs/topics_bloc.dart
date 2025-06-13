import 'package:bloc/bloc.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../domain/usecases/get_topics_use_case.dart';

part 'generated/topics_bloc.freezed.dart';
part 'topics_event.dart';
part 'topics_state.dart';

@injectable
class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final GetTopicsUsecase _getAllTopics;

  TopicsBloc({required GetTopicsUsecase getAllTopics})
    : _getAllTopics = getAllTopics,
      super(const TopicsState.initial()) {
    on<TopicsEvent>((event, emit) async {
      await event.map(getAllTopics: (event) => _handleGetTopic(event, emit));
    });
  }

  _handleGetTopic(_GetAllTopics event, Emitter<TopicsState> emit) {
    try {
      final topics = _getAllTopics.execute(event.folder, event.topic);
      app_config.printLog(
        'i',
        "Loaded topics for ${event.folder}/${event.topic}: ${topics.length} topics",
      );
      emit(state.copyWith(words: topics));
    } catch (e) {
      app_config.printLog('e', e.toString());
    }
  }
}
