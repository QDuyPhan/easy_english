// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../interpretation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InterpretationImpl _$$InterpretationImplFromJson(Map<String, dynamic> json) =>
    _$InterpretationImpl(
      lemma: json['lemma'] as String? ?? '',
      normalizedLemmas:
          (json['normalized_lemmas'] as List<dynamic>?)
              ?.map((e) => NormalizedLemma.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      partOfSpeech: json['part_of_speech'] as String? ?? '',
      grammar:
          (json['grammar'] as List<dynamic>?)
              ?.map((e) => Grammar.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InterpretationImplToJson(
  _$InterpretationImpl instance,
) => <String, dynamic>{
  'lemma': instance.lemma,
  'normalized_lemmas':
      instance.normalizedLemmas.map((e) => e.toJson()).toList(),
  'part_of_speech': instance.partOfSpeech,
  'grammar': instance.grammar.map((e) => e.toJson()).toList(),
};
