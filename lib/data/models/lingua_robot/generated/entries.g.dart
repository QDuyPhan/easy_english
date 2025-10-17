// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntriesImpl _$$EntriesImplFromJson(Map<String, dynamic> json) =>
    _$EntriesImpl(
      entry:
          (json['entry'] as List<dynamic>?)
              ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EntriesImplToJson(_$EntriesImpl instance) =>
    <String, dynamic>{'entry': instance.entry.map((e) => e.toJson()).toList()};
