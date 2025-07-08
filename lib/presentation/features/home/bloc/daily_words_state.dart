part of 'daily_words_bloc.dart';

sealed class DailyWordsState extends Equatable {
  const DailyWordsState();
}

final class DailyWordsInitial extends DailyWordsState {
  @override
  List<Object> get props => [];
}

final class DailyWordsLoading extends DailyWordsState {
  const DailyWordsLoading();

  @override
  List<Object> get props => [];
}

final class DailyWordsLoaded extends DailyWordsState {
  final List<WordEntity> words;

  const DailyWordsLoaded(this.words);

  @override
  List<Object> get props => [words];
}

final class DailyWordsError extends DailyWordsState {
  final String message;

  const DailyWordsError(this.message);

  @override
  List<Object> get props => [message];
}
