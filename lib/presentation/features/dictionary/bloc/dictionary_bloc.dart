import 'package:bloc/bloc.dart';
import 'package:easy_english/domain/usecases/get_dictionary_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../domain/entities/dictionary_entity.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';
part 'generated/dictionary_bloc.freezed.dart';

@injectable
class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final GetDictionaryUseCase _getDictionaryUseCase;

  DictionaryBloc({required GetDictionaryUseCase getDictionaryUseCase})
    : _getDictionaryUseCase = getDictionaryUseCase,
      super(const DictionaryState.initial()) {
    on<DictionaryEvent>((event, emit) async {
      await event.map(
        getDictionary: (event) => _handleGetDictionary(event, emit),
      );
    });
  }

  Future<void> _handleGetDictionary(
    _GetDictionary event,
    Emitter<DictionaryState> emit,
  ) async {
    final result = await _getDictionaryUseCase.execute();
    app_config.printLog('i', 'Loaded dictionary: ${result.length} words');
    emit(state.copyWith(dictionary: result));
  }
}
