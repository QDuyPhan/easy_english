import 'package:bloc/bloc.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/usecases/get_dictionary_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../di/injector.dart' as di;
import '../../../../domain/entities/dictionary_entity.dart';
import '../../../../domain/usecases/get_word_from_topic_use_case.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';
part 'generated/dictionary_bloc.freezed.dart';

@injectable
class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictionaryBloc() : super(const DictionaryState()) {
    on<DictionaryEvent>((event, emit) async {
      await event.map(
        getDictionary: (e) => _handleGetDictionary(e, emit),
        getWords: (e) => _handleGetWords(e, emit),
      );
    });
  }

  Future<void> _handleGetWords(
    _GetWords event,
    Emitter<DictionaryState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await di.getIt<GetWordFromTopicUseCase>().call(
        event.folder,
        event.topic,
      );
      result.fold(
        (failure) {
          emit(state.copyWith(error: failure.message));
          emit(state.copyWith(isLoading: false));
        },
        (words) {
          emit(state.copyWith(words: words));
          emit(state.copyWith(isLoading: false));
        },
      );
    } catch (e) {
      app_config.printLog('e', e.toString());
      emit(state.copyWith(error: e.toString()));
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _handleGetDictionary(
    _GetDictionary event,
    Emitter<DictionaryState> emit,
  ) async {
    try {
      final result = await di.getIt<GetDictionaryUseCase>().execute();
      result.fold(
        (failure) {
          emit(state.copyWith(error: failure.message));
        },
        (dictionary) {
          emit(state.copyWith(dictionary: dictionary));
        },
      );
    } catch (e) {
      app_config.printLog('e', e.toString());
      emit(state.copyWith(error: e.toString()));
    }
  }
}
