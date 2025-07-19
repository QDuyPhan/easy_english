import 'package:injectable/injectable.dart';

import '../repositories/notification_repository.dart';

@injectable
class ScheduleNotificationUseCase {
  final NotificationRepository _notificationRepository;

  const ScheduleNotificationUseCase(this._notificationRepository);

  Future<void> call({
    required int hour,
    required int minute,
    required String title,
    required String body,
  }) async {
    final now = DateTime.now();
    var scheduled = DateTime(now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    await _notificationRepository.schedule(0, title, body, scheduled);
  }
}
