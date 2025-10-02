// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SenseImpl _$$SenseImplFromJson(Map<String, dynamic> json) => _$SenseImpl(
  definition: json['definition'] as String? ?? "",
  examples:
      (json['examples'] as List<dynamic>?)
          ?.map((e) => Example.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SenseImplToJson(_$SenseImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'examples': instance.examples.map((e) => e.toJson()).toList(),
    };
