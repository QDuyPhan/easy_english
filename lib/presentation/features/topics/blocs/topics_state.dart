import 'package:equatable/equatable.dart';

import '../../../../domain/entities/word_entity.dart';

abstract class TopicsState extends Equatable {
  const TopicsState();

  @override
  List<Object> get props => [];
}

final class TopicsInitial extends TopicsState {
  const TopicsInitial();
}

final class TopicsLoading extends TopicsState {
  const TopicsLoading();
}

class TopicsInitialized extends TopicsState {}

class TopicsError extends TopicsState {
  final String message;

  const TopicsError(this.message);

  @override
  List<Object> get props => [message];
}

class TopicsLoaded extends TopicsState {
  final List<WordEntity> words;

  const TopicsLoaded({required this.words});

  @override
  List<Object> get props => [words];
}
