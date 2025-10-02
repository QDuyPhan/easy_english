import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/injector.dart' as di;
import '../../../../domain/usecases/hero_ku/fetch_randoms_words_use_case.dart';

part 'generated/words_bloc.freezed.dart';
part 'words_event.dart';
part 'words_state.dart';

@injectable
class WordsBloc extends Bloc<WordsEvent, WordsState> {
  WordsBloc() : super(WordsState()) {
    on<WordsEvent>((event, emit) async {
      await event.map(getListWord: (value) => _handleGetListWord(value, emit));
    });
  }

  Future<void> _handleGetListWord(
    _GetListWord event,
    Emitter<WordsState> emit,
  ) async {
    int page = state.page;
    emit(state.copyWith(isLoading: true));

    final result = await di.getIt<FetchRandomsWordsUseCase>().call(
      state.pageSize,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (words) {
        List<String> currentWords = List<String>.from(state.words);
        currentWords.addAll(words);
        emit(state.copyWith(words: currentWords, page: page + 1));
      },
    );

    emit(state.copyWith(isLoading: false));
  }
}
