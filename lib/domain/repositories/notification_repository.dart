import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationRepository {
  Future<void> schedule(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
  );

  Future<void> cancel(int id);

  Future<bool> areNotificationsEnabled();

  Future<List<PendingNotificationRequest>> getPendingNotifications();

  Future<void> scheduleDailyReminder(
    int id,
    String title,
    String body,
    int hour,
    int minute,
  );
}
