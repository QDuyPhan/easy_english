import 'package:dartz/dartz.dart';
import 'package:easy_english/domain/entities/scheduled_notification_entity.dart';

import '../../core/errors/failure.dart';

abstract interface class NotificationsRepository {
  Future<void> saveScheduledNotification(
    ScheduledNotificationEntity scheduledNotification,
  );

  List<ScheduledNotificationEntity> getScheduledNotifications();

  Future<Either<Failure, void>> removeScheduledNotification(int id);
}
