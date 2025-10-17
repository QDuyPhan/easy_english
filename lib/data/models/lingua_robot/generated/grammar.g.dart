// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../grammar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrammarImpl _$$GrammarImplFromJson(
  Map<String, dynamic> json,
) => _$GrammarImpl(
  number:
      (json['number'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  grammarCase:
      (json['grammar_case'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  person:
      (json['person'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  verbForm:
      (json['verb_form'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tense:
      (json['tense'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  mood:
      (json['mood'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$GrammarImplToJson(_$GrammarImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'grammar_case': instance.grammarCase,
      'person': instance.person,
      'verb_form': instance.verbForm,
      'tense': instance.tense,
      'mood': instance.mood,
    };
