// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
  entry: json['entry'] as String? ?? '',
  pronunciations:
      (json['pronunciations'] as List<dynamic>?)
          ?.map((e) => Pronunciation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  interpretations:
      (json['interpretations'] as List<dynamic>?)
          ?.map((e) => Interpretation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  lexemes:
      (json['lexemes'] as List<dynamic>?)
          ?.map((e) => Lexeme.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$$EntryImplToJson(
  _$EntryImpl instance,
) => <String, dynamic>{
  'entry': instance.entry,
  'pronunciations': instance.pronunciations.map((e) => e.toJson()).toList(),
  'interpretations': instance.interpretations.map((e) => e.toJson()).toList(),
  'lexemes': instance.lexemes.map((e) => e.toJson()).toList(),
  'license': instance.license?.toJson(),
  'source_urls': instance.sourceUrls,
};
