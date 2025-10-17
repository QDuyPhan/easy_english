// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormImpl _$$FormImplFromJson(Map<String, dynamic> json) => _$FormImpl(
  form: json['form'] as String? ?? '',
  grammar:
      (json['grammar'] as List<dynamic>?)
          ?.map((e) => Grammar.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$FormImplToJson(_$FormImpl instance) =>
    <String, dynamic>{
      'form': instance.form,
      'grammar': instance.grammar.map((e) => e.toJson()).toList(),
    };
