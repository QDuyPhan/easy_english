import 'package:bloc/bloc.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/usecases/search_words_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'generated/search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchWordsUseCase _searchWordsUseCase;

  SearchBloc({required SearchWordsUseCase searchWordsUseCase})
    : _searchWordsUseCase = searchWordsUseCase,
      super(const SearchState.initial()) {
    on<SearchEvent>((event, emit) async {
      await event.map(
        searchWords: (event) => _handleSearchWords(event, emit),
        clearSearch: (event) => _handleClearSearch(event, emit),
      );
    });
  }

  _handleSearchWords(_SearchWords event, Emitter<SearchState> emit) {
    try {
      if (event.query.trim().isEmpty) {
        emit(const SearchState.initial());
        return;
      }

      emit(const SearchState.loading());

      final results = _searchWordsUseCase.execute(event.query);

      if (results.isEmpty) {
        emit(const SearchState.noResults());
      } else {
        emit(SearchState.success(results: results));
      }
    } catch (e) {
      emit(SearchState.error(message: e.toString()));
    }
  }

  _handleClearSearch(_ClearSearch event, Emitter<SearchState> emit) {
    emit(const SearchState.initial());
  }
}
