import 'package:bloc/bloc.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/usecases/save_topic_word_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../domain/entities/word_status_entity.dart';
import '../../../../domain/usecases/get_topic_from_json_use_case.dart';
import '../../../../domain/usecases/get_topics_use_case.dart';

part 'generated/topics_bloc.freezed.dart';
part 'topics_event.dart';
part 'topics_state.dart';

@injectable
class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final GetTopicsUseCase _getTopicsUseCase;
  final SaveTopicWordUseCase _saveTopicWordUseCase;
  final GetTopicFromJsonUseCase _getTopicFromJsonUseCase;

  TopicsBloc({
    required SaveTopicWordUseCase saveTopicWordUseCase,
    required GetTopicsUseCase getTopicsUseCase,
    required GetTopicFromJsonUseCase getTopicFromJsonUseCase,
  }) : _saveTopicWordUseCase = saveTopicWordUseCase,
       _getTopicsUseCase = getTopicsUseCase,
       _getTopicFromJsonUseCase = getTopicFromJsonUseCase,
       super(const TopicsState.initial()) {
    on<TopicsEvent>((event, emit) async {
      await event.map(
        getAllTopics: (event) => _handleGetTopic(event, emit),
        saveWord: (event) => _handleSaveWord(event, emit),
        getTopicFromJson: (event) => _handleGetTopicFromJson(event, emit),
      );
    });
  }

  Future<void> _handleGetTopicFromJson(
    _GetTopicFromJson event,
    Emitter<TopicsState> emit,
  ) async {
    try {
      final topic = await _getTopicFromJsonUseCase.execute(
        event.folder,
        event.topic,
      );
      app_config.printLog(
        'i',
        "Loaded topics for ${event.folder}/${event.topic}: ${topic.length} topics",
      );
      emit(state.copyWith(words: topic));
    } catch (e) {
      app_config.printLog('e', e.toString());
    }
  }

  Future<void> _handleGetTopic(
    _GetAllTopics event,
    Emitter<TopicsState> emit,
  ) async {
    try {
      final topics = await _getTopicsUseCase.execute(event.folder, event.topic);
      app_config.printLog(
        'i',
        "Loaded topics for ${event.folder}/${event.topic}: ${topics.length} topics",
      );
      emit(state.copyWith(words: topics));
    } catch (e) {
      app_config.printLog('e', e.toString());
    }
  }

  Future<void> _handleSaveWord(
    _SaveWord event,
    Emitter<TopicsState> emit,
  ) async {
    try {
      final newWord = event.word.copyWith(status: event.wordStatus);
      app_config.printLog('i', 'Saving word: $newWord');
      final words =
          state.words
              .map((word) => word == event.word ? newWord : word)
              .toList();
      await _saveTopicWordUseCase.execute(newWord);
      emit(state.copyWith(words: words));
    } catch (e) {
      app_config.printLog('e', e.toString());
    }
  }
}
