import 'package:bloc/bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_event.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  VocabularyBloc() : super(const VocabularyInitial()) {
    on<GetAllOxfordWords>(_handleGetAllOxfordWords);
  }

  Future<void> _handleGetAllOxfordWords(
    GetAllOxfordWords event,
    Emitter<VocabularyState> emit,
  ) async {
    // try {
    //   emit(const VocabularyLoading());
    //   final words = await _getAllOxfordWordsUseCase.execute();
    //   app_config.printLog('i', "Oxford words loaded: ${words.length}");
    //   emit(VocabularyLoaded(words));
    // } catch (e) {
    //   app_config.printLog('e', e.toString());
    //   emit(VocabularyError(e.toString()));
    // }
  }
}
