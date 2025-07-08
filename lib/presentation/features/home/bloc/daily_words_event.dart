part of 'daily_words_bloc.dart';

sealed class DailyWordsEvent extends Equatable {
  const DailyWordsEvent();
}

final class GetDailyWordsEvent extends DailyWordsEvent {
  const GetDailyWordsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
