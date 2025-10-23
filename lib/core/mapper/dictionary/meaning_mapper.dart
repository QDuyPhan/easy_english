import 'package:easy_english/core/mapper/dictionary/definition_mapper.dart';

import '../../../data/models/dictionary/meaning.dart';
import '../../../domain/entities/dictionary/meaning_entity.dart';

class MeaningMapper {
  static MeaningEntity toMeaningEntity(Meaning model) {
    return MeaningEntity(
      partOfSpeech: model.partOfSpeech,
      definitions:
          model.definitions
              ?.map((d) => DefinitionMapper.toDefinitionEntity(d))
              .toList() ??
          const [],
      synonyms: model.synonyms ?? const [],
      antonyms: model.antonyms ?? const [],
    );
  }

  static Meaning toMeaningModel(MeaningEntity entity) {
    return Meaning(
      partOfSpeech: entity.partOfSpeech,
      definitions:
          entity.definitions
              ?.map((d) => DefinitionMapper.toDefinitionModel(d))
              .toList() ??
          const [],
      synonyms: entity.synonyms,
      antonyms: entity.antonyms,
    );
  }
}
