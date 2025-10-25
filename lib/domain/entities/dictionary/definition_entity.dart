class DefinitionEntity {
  final String? definition;
  final List<String>? synonyms;
  final List<String>? antonyms;
  final String? example;

  DefinitionEntity({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  DefinitionEntity copyWith({
    String? definition,
    List<String>? synonyms,
    List<String>? antonyms,
    String? example,
  }) => DefinitionEntity(
    definition: definition ?? this.definition,
    synonyms: synonyms ?? this.synonyms,
    antonyms: antonyms ?? this.antonyms,
    example: example ?? this.example,
  );

  factory DefinitionEntity.fromJson(Map<String, dynamic> json) {
    return DefinitionEntity(
      definition: json['definition'] ?? '',
      synonyms:
          json['synonyms'] != null
              ? List<String>.from(json["synonyms"].map((x) => x))
              : [],
      antonyms:
          json['antonyms'] != null
              ? List<String>.from(json["antonyms"].map((x) => x))
              : [],
      example: json['example'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'definition': definition ?? '',
    'synonyms': synonyms ?? [],
    'antonyms': antonyms ?? [],
    'example': example ?? '',
  };
}
