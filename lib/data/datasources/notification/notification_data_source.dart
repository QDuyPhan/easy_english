import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../core/constants/notification_category.dart';

abstract class NotificationDataSource {
  Future<void> initialize();

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationCategory category,
    required String threadIdentifier,
    String? payload,
  });

  Future<void> cancelNotification(int id);
}

@LazySingleton(as: NotificationDataSource)
class NotificationDataSourceImpl implements NotificationDataSource {
  NotificationDataSourceImpl();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  @override
  Future<void> initialize() async {
    final android = AndroidInitializationSettings('launcher');
    final ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final settings = InitializationSettings(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.initialize(settings);
  }

  @override
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationCategory category,
    required String threadIdentifier,
    String? payload,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      category.id,
      category.name,
      channelDescription: category.description,
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );
    final iosDetails = DarwinNotificationDetails(
      categoryIdentifier: category.id,
      threadIdentifier: threadIdentifier,
    );
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      "\$body\${kDebugMode ? ' - \${scheduledDate.toIso8601String()}' : ''}",
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }
}
