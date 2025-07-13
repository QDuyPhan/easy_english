abstract class NotificationRepository {
  Future<void> schedule(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
  );

  Future<void> cancel(int id);
}
