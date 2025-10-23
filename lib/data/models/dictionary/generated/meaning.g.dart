// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../meaning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeaningImpl _$$MeaningImplFromJson(
  Map<String, dynamic> json,
) => _$MeaningImpl(
  partOfSpeech: json['part_of_speech'] as String? ?? '',
  definitions:
      (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  synonyms:
      (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  antonyms:
      (json['antonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$MeaningImplToJson(_$MeaningImpl instance) =>
    <String, dynamic>{
      'part_of_speech': instance.partOfSpeech,
      'definitions': instance.definitions.map((e) => e.toJson()).toList(),
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };
