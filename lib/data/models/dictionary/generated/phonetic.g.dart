// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../phonetic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneticImpl _$$PhoneticImplFromJson(Map<String, dynamic> json) =>
    _$PhoneticImpl(
      text: json['text'] as String?,
      audio: json['audio'] as String?,
      sourceUrl: json['source_url'] as String?,
    );

Map<String, dynamic> _$$PhoneticImplToJson(_$PhoneticImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
      'source_url': instance.sourceUrl,
    };
