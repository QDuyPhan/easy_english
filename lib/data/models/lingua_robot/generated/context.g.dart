// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContextImpl _$$ContextImplFromJson(Map<String, dynamic> json) =>
    _$ContextImpl(
      regions:
          (json['regions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContextImplToJson(_$ContextImpl instance) =>
    <String, dynamic>{'regions': instance.regions};
