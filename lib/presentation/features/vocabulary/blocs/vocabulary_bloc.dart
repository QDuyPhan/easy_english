import 'package:bloc/bloc.dart';
import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/domain/usecases/get_all_oxford_words_usecase.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_event.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final GetAllOxfordWordsUseCase _getAllOxfordWordsUseCase;

  VocabularyBloc({required GetAllOxfordWordsUseCase getAllOxfordWordsUseCase})
    : _getAllOxfordWordsUseCase = getAllOxfordWordsUseCase,
      super(VocabularyInitial()) {
    on<GetAllOxfordWords>(_handleGetAllOxfordWords);
  }

  _handleGetAllOxfordWords(
    GetAllOxfordWords event,
    Emitter<VocabularyState> emit,
  ) {
    try {
      emit(const VocabularyLoading());
      final words = _getAllOxfordWordsUseCase.execute();
      app_config.printLog('i', 'words: ${words.map((e) => e.word).toList()}');
      emit(VocabularyLoaded(words));
    } catch (e) {
      app_config.printLog('e', e.toString());
      emit(VocabularyError(e.toString()));
    }
  }
}
