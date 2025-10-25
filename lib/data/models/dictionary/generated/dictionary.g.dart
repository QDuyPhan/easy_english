// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DictionaryImpl _$$DictionaryImplFromJson(Map<String, dynamic> json) =>
    _$DictionaryImpl(
      word: json['word'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      phonetics:
          (json['phonetics'] as List<dynamic>?)
              ?.map((e) => Phonetic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meanings:
          (json['meanings'] as List<dynamic>?)
              ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      license:
          json['license'] == null
              ? null
              : License.fromJson(json['license'] as Map<String, dynamic>),
      sourceUrls:
          (json['source_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DictionaryImplToJson(_$DictionaryImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'phonetics': instance.phonetics?.map((e) => e.toJson()).toList(),
      'meanings': instance.meanings?.map((e) => e.toJson()).toList(),
      'license': instance.license?.toJson(),
      'source_urls': instance.sourceUrls,
    };
