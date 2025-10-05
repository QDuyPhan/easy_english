import 'package:bloc/bloc.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../di/injector.dart' as di;
import '../../../../domain/usecases/get_all_oxford_words_use_case.dart';

part 'generated/vocabulary_bloc.freezed.dart';
part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

@injectable
class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  VocabularyBloc() : super(const VocabularyState()) {
    on<VocabularyEvent>((event, emit) async {
      await event.map(getListWord: (e) => _handleGetAllOxfordWords(e, emit));
    });
  }

  Future<void> _handleGetAllOxfordWords(
    _GetAllOxfordWords event,
    Emitter<VocabularyState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await di.getIt<GetAllOxfordWordsUseCase>().execute();
      result.fold(
        (failure) {
          emit(state.copyWith(error: failure.message));
        },
        (words) {
          final shuffledWords = [...words]..shuffle();
          emit(state.copyWith(words: shuffledWords));
        },
      );

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      app_config.printLog('e', e.toString());
      emit(state.copyWith(error: e.toString()));
      emit(state.copyWith(isLoading: false));
    }
  }
}
