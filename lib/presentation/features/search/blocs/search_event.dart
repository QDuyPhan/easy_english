part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchWords({required String query}) = _SearchWords;
  const factory SearchEvent.clearSearch() = _ClearSearch;
}
