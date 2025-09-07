import 'package:dartz/dartz.dart';
import 'package:easy_english/core/errors/failure.dart';
import 'package:easy_english/domain/entities/scheduled_notification_entity.dart';
import 'package:injectable/injectable.dart';

import '../../core/mapper/app_mappr.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/local/local_data.dart';
import '../models/scheduled_notification.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final LocalData _localData;
  final AppMappr _appMappr;

  NotificationsRepositoryImpl({
    required LocalData localData,
    required AppMappr appMappr,
  }) : _localData = localData,
       _appMappr = appMappr;

  @override
  List<ScheduledNotificationEntity> getScheduledNotifications() {
    final scheduledNotifications = _localData.getScheduledNotifications();
    final now = DateTime.now();

    final expiredNotifications =
        scheduledNotifications
            .where(
              (notification) => DateTime.parse(
                _appMappr
                    .convert<
                      ScheduledNotification,
                      ScheduledNotificationEntity
                    >(notification)
                    .scheduledDate,
              ).isBefore(now),
            )
            .toList();

    for (final notification in expiredNotifications) {
      _localData.removeScheduledNotification(notification.id);
    }

    final validNotifications =
        scheduledNotifications
            .where(
              (notification) => DateTime.parse(
                _appMappr
                    .convert<
                      ScheduledNotification,
                      ScheduledNotificationEntity
                    >(notification)
                    .scheduledDate,
              ).isAfter(now),
            )
            .toList();

    final validNotificationsEntities =
        validNotifications
            .map(
              (notification) => _appMappr
                  .convert<ScheduledNotification, ScheduledNotificationEntity>(
                    notification,
                  ),
            )
            .toList();

    return validNotificationsEntities;
  }

  @override
  Future<void> saveScheduledNotification(
    ScheduledNotificationEntity scheduledNotification,
  ) {
    final mappedNotification = _appMappr
        .convert<ScheduledNotificationEntity, ScheduledNotification>(
          scheduledNotification,
        );
    return _localData.saveScheduledNotification(mappedNotification);
  }

  @override
  Future<Either<Failure, void>> removeScheduledNotification(int id) async {
    try {
      await _localData.removeScheduledNotification(id);
      return const Right(null);
    } catch (e) {
      return Left(
        Failure.general(message: 'There is no notification with this id'),
      );
    }
  }
}
