import 'package:easy_english/core/constants/notification_category.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification/notification_data_source.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _notificationDataSource;

  NotificationRepositoryImpl({
    required NotificationDataSource notificationDataSource,
  }) : _notificationDataSource = notificationDataSource;

  @override
  Future<void> cancel(int id) => _notificationDataSource.cancelNotification(id);

  @override
  Future<bool> areNotificationsEnabled() =>
      _notificationDataSource.areNotificationsEnabled();

  @override
  Future<List<PendingNotificationRequest>> getPendingNotifications() =>
      _notificationDataSource.getPendingNotifications();

  @override
  Future<void> schedule(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
  ) async {
    await _notificationDataSource.scheduleNotification(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledTime,
      category: NotificationCategory.dailyReminder,
      threadIdentifier: 'reminder-thread',
    );
  }

  @override
  Future<void> scheduleDailyReminder(
    int id,
    String title,
    String body,
    int hour,
    int minute,
  ) async {
    // Check if notifications are enabled
    final notificationsEnabled =
        await _notificationDataSource.areNotificationsEnabled();
    if (!notificationsEnabled) {
      throw Exception(
        'Notifications are not enabled. Please enable notifications in app settings.',
      );
    }

    // Request permissions first
    final hasPermission = await _notificationDataSource.requestPermissions();
    if (!hasPermission) {
      throw Exception(
        'Notification permissions not granted. Please enable notifications in app settings.',
      );
    }

    try {
      await _notificationDataSource.scheduleDailyReminder(
        id: id,
        title: title,
        body: body,
        hour: hour,
        minute: minute,
        category: NotificationCategory.dailyReminder,
        threadIdentifier: 'reminder-thread',
      );
    } catch (e) {
      if (e.toString().contains('invalid_led_details')) {
        throw Exception('Notification configuration error. Please try again.');
      }
      throw Exception('Failed to schedule daily reminder: ${e.toString()}');
    }
  }
}
