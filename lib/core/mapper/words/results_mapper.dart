import 'package:easy_english/data/models/words/results.dart';

class ResultsMapper {
  static Results toEntity(Results entity) {
    return Results(
      definition: entity.definition,
      partOfSpeech: entity.partOfSpeech,
      synonyms: entity.synonyms,
      typeOf: entity.typeOf,
      derivation: entity.derivation,
      examples: entity.examples,
    );
  }

  static Results toModel(Results word) {
    return Results(
      definition: word.definition!,
      partOfSpeech: word.partOfSpeech!,
      synonyms: word.synonyms,
      typeOf: word.typeOf,
      derivation: word.derivation,
      examples: word.examples,
    );
  }
}
