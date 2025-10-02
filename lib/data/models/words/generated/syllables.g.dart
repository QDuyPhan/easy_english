// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../syllables.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyllablesImpl _$$SyllablesImplFromJson(Map<String, dynamic> json) =>
    _$SyllablesImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      list:
          (json['list'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$SyllablesImplToJson(_$SyllablesImpl instance) =>
    <String, dynamic>{'count': instance.count, 'list': instance.list};
