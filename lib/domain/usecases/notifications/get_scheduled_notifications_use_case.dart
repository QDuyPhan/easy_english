import 'package:injectable/injectable.dart';

import '../../entities/scheduled_notification_entity.dart';
import '../../repositories/notifications_repository.dart';

@injectable
class GetScheduledNotificationsUseCase {
  final NotificationsRepository _notificationRepository;

  const GetScheduledNotificationsUseCase(this._notificationRepository);

  List<ScheduledNotificationEntity> execute() {
    return _notificationRepository.getScheduledNotifications();
  }
}
