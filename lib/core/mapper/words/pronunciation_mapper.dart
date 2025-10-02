import 'package:easy_english/data/models/words/pronunciation.dart';

class PronunciationMapper {
  static Pronunciation toEntity(Pronunciation entity) {
    return Pronunciation(all: entity.all);
  }

  static Pronunciation toModel(Pronunciation pronunciation) {
    return Pronunciation(all: pronunciation.all!);
  }
}
