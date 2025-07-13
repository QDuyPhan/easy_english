import 'package:injectable/injectable.dart';

import '../repositories/notification_repository.dart';

@injectable
class ScheduleNotificationUseCase {
  final NotificationRepository _notificationRepository;

  const ScheduleNotificationUseCase(this._notificationRepository);

  Future<void> call({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) => _notificationRepository.schedule(id, title, body, scheduledTime);
}
