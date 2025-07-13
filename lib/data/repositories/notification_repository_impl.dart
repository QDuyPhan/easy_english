import 'package:easy_english/core/constants/notification_category.dart';
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
}
