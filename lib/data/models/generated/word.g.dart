// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordImpl _$$WordImplFromJson(Map<String, dynamic> json) => _$WordImpl(
  word: json['word'] as String? ?? "",
  pos: json['pos'] as String? ?? "",
  phonetic: json['phonetic'] as String? ?? "",
  phonetic_text: json['phonetic_text'] as String? ?? "",
  phonetic_am: json['phonetic_am'] as String? ?? "",
  phonetic_am_text: json['phonetic_am_text'] as String? ?? "",
  senses:
      (json['senses'] as List<dynamic>?)
          ?.map((e) => Sense.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  status:
      $enumDecodeNullable(_$WordStatusEnumMap, json['status']) ??
      WordStatus.unknown,
  id: json['id'] as String? ?? "",
);

Map<String, dynamic> _$$WordImplToJson(_$WordImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'pos': instance.pos,
      'phonetic': instance.phonetic,
      'phonetic_text': instance.phonetic_text,
      'phonetic_am': instance.phonetic_am,
      'phonetic_am_text': instance.phonetic_am_text,
      'senses': instance.senses.map((e) => e.toJson()).toList(),
      'status': _$WordStatusEnumMap[instance.status]!,
      'id': instance.id,
    };

const _$WordStatusEnumMap = {
  WordStatus.unknown: 'unknown',
  WordStatus.mastered: 'mastered',
  WordStatus.star: 'star',
};
