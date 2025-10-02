// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordImpl _$$WordImplFromJson(Map<String, dynamic> json) => _$WordImpl(
  word: json['word'] as String? ?? "",
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  syllables:
      json['syllables'] == null
          ? null
          : Syllables.fromJson(json['syllables'] as Map<String, dynamic>),
  pronunciation:
      json['pronunciation'] == null
          ? null
          : Pronunciation.fromJson(
            json['pronunciation'] as Map<String, dynamic>,
          ),
  frequency: (json['frequency'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$WordImplToJson(_$WordImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'syllables': instance.syllables?.toJson(),
      'pronunciation': instance.pronunciation?.toJson(),
      'frequency': instance.frequency,
    };
