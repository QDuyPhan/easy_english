// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lexeme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LexemeImpl _$$LexemeImplFromJson(Map<String, dynamic> json) => _$LexemeImpl(
  lemma: json['lemma'] as String? ?? '',
  partOfSpeech: json['part_of_speech'] as String? ?? '',
  senses:
      (json['senses'] as List<dynamic>?)
          ?.map((e) => Sense.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  forms:
      (json['forms'] as List<dynamic>?)
          ?.map((e) => Form.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$LexemeImplToJson(_$LexemeImpl instance) =>
    <String, dynamic>{
      'lemma': instance.lemma,
      'part_of_speech': instance.partOfSpeech,
      'senses': instance.senses.map((e) => e.toJson()).toList(),
      'forms': instance.forms.map((e) => e.toJson()).toList(),
    };
