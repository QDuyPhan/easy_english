import 'package:injectable/injectable.dart';

import '../../entities/scheduled_notification_entity.dart';
import '../../repositories/notifications_repository.dart';

@injectable
class SaveScheduledNotificationUseCase {
  final NotificationsRepository _notificationsRepository;

  const SaveScheduledNotificationUseCase(this._notificationsRepository);

  Future<void> execute(ScheduledNotificationEntity notification) {
    return _notificationsRepository.saveScheduledNotification(notification);
  }
}
