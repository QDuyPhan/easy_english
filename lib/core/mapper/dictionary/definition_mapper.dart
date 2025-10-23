import '../../../data/models/dictionary/definition.dart';
import '../../../domain/entities/dictionary/definition_entity.dart';

class DefinitionMapper {
  static DefinitionEntity toDefinitionEntity(Definition model) {
    return DefinitionEntity(
      definition: model.definition,
      synonyms: model.synonyms ?? const [],
      antonyms: model.antonyms ?? const [],
      example: model.example,
    );
  }

  static Definition toDefinitionModel(DefinitionEntity entity) {
    return Definition(
      definition: entity.definition,
      synonyms: entity.synonyms,
      antonyms: entity.antonyms,
      example: entity.example,
    );
  }
}
