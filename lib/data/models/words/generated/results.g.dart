// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsImpl _$$ResultsImplFromJson(
  Map<String, dynamic> json,
) => _$ResultsImpl(
  definition: json['definition'] as String? ?? "",
  partOfSpeech: json['part_of_speech'] as String? ?? "",
  synonyms:
      (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  typeOf:
      (json['type_of'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  hasTypes:
      (json['has_types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  derivation:
      (json['derivation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  examples:
      (json['examples'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$ResultsImplToJson(_$ResultsImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'part_of_speech': instance.partOfSpeech,
      'synonyms': instance.synonyms,
      'type_of': instance.typeOf,
      'has_types': instance.hasTypes,
      'derivation': instance.derivation,
      'examples': instance.examples,
    };
