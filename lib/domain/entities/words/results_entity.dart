import 'package:freezed_annotation/freezed_annotation.dart';

class ResultsEntity {
  final String definition;
  final String partOfSpeech;
  final List<String> synonyms;
  final List<String> typeOf;
  final List<String> hasTypes;
  final List<String> derivation;
  final List<String> examples;

  ResultsEntity({
    required this.definition,
    required this.partOfSpeech,
    required this.synonyms,
    required this.typeOf,
    required this.hasTypes,
    required this.derivation,
    required this.examples,
  });

  ResultsEntity copyWith({
    String? definition,
    String? partOfSpeech,
    List<String>? synonyms,
    List<String>? typeOf,
    List<String>? hasTypes,
    List<String>? derivation,
    List<String>? examples,
  }) {
    return ResultsEntity(
      definition: definition ?? this.definition,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      synonyms: synonyms ?? this.synonyms,
      typeOf: typeOf ?? this.typeOf,
      hasTypes: hasTypes ?? this.hasTypes,
      derivation: derivation ?? this.derivation,
      examples: examples ?? this.examples,
    );
  }

  factory ResultsEntity.fromJson(Map<String, dynamic> json) {
    return ResultsEntity(
      definition: json['definition'] ?? "",
      partOfSpeech: json['partOfSpeech'] ?? "",
      synonyms:
          json['synonyms'] != null
              ? List<String>.from(json['synonyms'].map((x) => x).toList())
              : [],
      typeOf:
          json['typeOf'] != null
              ? List<String>.from(json['typeOf'].map((x) => x).toList())
              : [],
      hasTypes:
          json['hasTypes'] != null
              ? List<String>.from(json['hasTypes'].map((x) => x).toList())
              : [],
      derivation:
          json['derivation'] != null
              ? List<String>.from(json['derivation'].map((x) => x).toList())
              : [],
      examples:
          json['examples'] != null
              ? List<String>.from(json['examples'].map((x) => x).toList())
              : [],
    );
  }
}
