class DefinitionEntity {
  final String? definition;
  final List<dynamic>? synonyms;
  final List<dynamic>? antonyms;
  final String? example;

  DefinitionEntity({
    this.definition,
    this.synonyms = const [],
    this.antonyms = const [],
    this.example,
  });

  DefinitionEntity copyWith({
    String? definition,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
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
              ? List<dynamic>.from(json["synonyms"].map((x) => x))
              : [],
      antonyms:
          json['antonyms'] != null
              ? List<dynamic>.from(json["antonyms"].map((x) => x))
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
