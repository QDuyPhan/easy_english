class NotificationCategory {
  final String id;
  final String name;
  final String description;

  const NotificationCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  static const NotificationCategory dailyReminder = NotificationCategory(
    id: 'reminder',
    name: 'Daily Reminder',
    description: 'Nhắc nhở học từ mới',
  );
}
