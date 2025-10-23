import 'definition_entity.dart';

class MeaningEntity {
  final String? partOfSpeech;
  final List<DefinitionEntity>? definitions;
  final List<String>? synonyms;
  final List<String>? antonyms;

  MeaningEntity({
    this.partOfSpeech,
    this.definitions,
    this.synonyms = const [],
    this.antonyms = const [],
  });

  MeaningEntity copyWith({
    String? partOfSpeech,
    List<DefinitionEntity>? definitions,
    List<String>? synonyms,
    List<String>? antonyms,
  }) {
    return MeaningEntity(
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      definitions: definitions ?? this.definitions,
      synonyms: synonyms ?? this.synonyms,
      antonyms: antonyms ?? this.antonyms,
    );
  }

  factory MeaningEntity.fromJson(Map<String, dynamic> json) {
    return MeaningEntity(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definitions:
          json['definitions'] != null
              ? List<DefinitionEntity>.from(
                json["definitions"].map((x) => DefinitionEntity.fromJson(x)),
              )
              : [],
      synonyms:
          json['synonyms'] != null
              ? List<String>.from(json["synonyms"].map((x) => x))
              : [],
      antonyms:
          json['antonyms'] != null
              ? List<String>.from(json["antonyms"].map((x) => x))
              : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'partOfSpeech': partOfSpeech ?? '',
    'definitions': definitions ?? [],
    'synonyms': synonyms ?? [],
    'antonyms': antonyms ?? [],
  };
}
