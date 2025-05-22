import 'package:equatable/equatable.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();
}

class GetAllOxfordWords extends VocabularyEvent {
  const GetAllOxfordWords();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
