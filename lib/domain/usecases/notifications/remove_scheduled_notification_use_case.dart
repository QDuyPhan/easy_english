import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../repositories/notifications_repository.dart';

@injectable
class RemoveScheduledNotificationUseCase {
  final NotificationsRepository _notificationRepository;

  const RemoveScheduledNotificationUseCase(this._notificationRepository);

  Future<Either<Failure, void>> execute({required int id}) {
    return _notificationRepository.removeScheduledNotification(id: id);
  }
}
