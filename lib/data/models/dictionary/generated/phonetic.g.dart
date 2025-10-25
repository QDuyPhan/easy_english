// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../phonetic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneticImpl _$$PhoneticImplFromJson(Map<String, dynamic> json) =>
    _$PhoneticImpl(
      text: json['text'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      sourceUrl: json['source_url'] as String? ?? '',
      license:
          json['license'] == null
              ? null
              : License.fromJson(json['license'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhoneticImplToJson(_$PhoneticImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
      'source_url': instance.sourceUrl,
      'license': instance.license?.toJson(),
    };
