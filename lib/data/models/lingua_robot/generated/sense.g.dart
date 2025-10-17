// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SenseImpl _$$SenseImplFromJson(Map<String, dynamic> json) => _$SenseImpl(
  definition: json['definition'] as String? ?? '',
  labels:
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$SenseImplToJson(_$SenseImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'labels': instance.labels,
    };
