import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/injector.dart' as di;
import '../../../../domain/entities/dictionary/dictionary_entity.dart';
import '../../../../domain/usecases/dictionary/get_word_translate_use_case.dart';

part 'generated/translate_bloc.freezed.dart';
part 'translate_event.dart';
part 'translate_state.dart';

@injectable
class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  TranslateBloc() : super(const TranslateState()) {
    on<TranslateEvent>((event, emit) async {
      await event.map(
        translateWord: (value) => _handleTranslateWord(value, emit),
      );
    });
  }

  Future<void> _handleTranslateWord(
    _TranslateWord event,
    Emitter<TranslateState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await di.getIt<GetWordTranslateUseCase>().execute(
      event.word,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (word) {
        emit(state.copyWith(dictionaries: word));
      },
    );

    emit(state.copyWith(isLoading: false));
  }
}
