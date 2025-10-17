// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pronunciation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PronunciationImpl _$$PronunciationImplFromJson(Map<String, dynamic> json) =>
    _$PronunciationImpl(
      audio:
          json['audio'] == null
              ? null
              : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      transcriptions:
          (json['transcriptions'] as List<dynamic>?)
              ?.map((e) => Transcription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      context:
          json['context'] == null
              ? null
              : Context.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PronunciationImplToJson(_$PronunciationImpl instance) =>
    <String, dynamic>{
      'audio': instance.audio?.toJson(),
      'transcriptions': instance.transcriptions.map((e) => e.toJson()).toList(),
      'context': instance.context?.toJson(),
    };
