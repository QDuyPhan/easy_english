// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefinitionImpl _$$DefinitionImplFromJson(Map<String, dynamic> json) =>
    _$DefinitionImpl(
      definition: json['definition'] as String?,
      synonyms: json['synonyms'] as List<dynamic>?,
      antonyms: json['antonyms'] as List<dynamic>?,
      example: json['example'] as String?,
    );

Map<String, dynamic> _$$DefinitionImplToJson(_$DefinitionImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'example': instance.example,
    };
