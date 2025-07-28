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
    // Cancel any existing daily reminder first
    await _notificationRepository.cancel(0);

    // Schedule new daily reminder
    await _notificationRepository.scheduleDailyReminder(
      0, // Use ID 0 for daily reminder
      title,
      body,
      hour,
      minute,
    );
  }
}
