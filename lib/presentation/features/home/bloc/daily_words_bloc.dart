import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/word_entity.dart';
import '../../../../domain/usecases/get_daily_words_use_case.dart';

part 'daily_words_event.dart';

part 'daily_words_state.dart';

@injectable
class DailyWordsBloc extends Bloc<DailyWordsEvent, DailyWordsState> {
  final GetDailyWordsUseCase _getDailyWordsUseCase;

  DailyWordsBloc({required GetDailyWordsUseCase getDailyWordsUseCase})
    : _getDailyWordsUseCase = getDailyWordsUseCase,
      super(DailyWordsInitial()) {
    on<GetDailyWordsEvent>(_handleGetDailyWords);
  }

  void _handleGetDailyWords(
    GetDailyWordsEvent event,
    Emitter<DailyWordsState> emit,
  ) async {
    final words = await _getDailyWordsUseCase.execute();
    emit(DailyWordsLoaded(words));
  }
}
