// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../scheduled_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduledNotificationImpl _$$ScheduledNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$ScheduledNotificationImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? "",
  body: json['body'] as String? ?? "",
  scheduledDate: json['scheduled_date'] as String? ?? "",
);

Map<String, dynamic> _$$ScheduledNotificationImplToJson(
  _$ScheduledNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'scheduled_date': instance.scheduledDate,
};
