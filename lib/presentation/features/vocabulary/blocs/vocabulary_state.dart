part of 'vocabulary_bloc.dart';

// abstract class VocabularyState extends Equatable {
//   const VocabularyState();
// }
//
// class VocabularyInitial extends VocabularyState {
//   const VocabularyInitial();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class VocabularyLoading extends VocabularyState {
//   const VocabularyLoading();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class VocabularyError extends VocabularyState {
//   final String message;
//
//   const VocabularyError(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }
//
// class VocabularyLoaded extends VocabularyState {
//   final List<WordEntity> words;
//
//   const VocabularyLoaded(this.words);
//
//   @override
//   List<Object?> get props => [words];
// }

@freezed
class VocabularyState with _$VocabularyState {
  const factory VocabularyState({
    @Default([]) List<WordEntity> words,
    @Default(false) bool isLoading,
    @Default('') String error,
    @Default('') String message,
  }) = _VocabularyState;
}
