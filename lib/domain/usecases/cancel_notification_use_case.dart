import 'package:injectable/injectable.dart';

import '../repositories/notification_repository.dart';

@injectable
class CancelNotificationUseCase {
  final NotificationRepository _notificationRepository;

  CancelNotificationUseCase(this._notificationRepository);

  Future<void> call(int id) => _notificationRepository.cancel(id);
}
