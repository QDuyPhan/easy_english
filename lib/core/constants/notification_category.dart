class NotificationCategory {
  final String id;
  final String name;
  final String description;

  const NotificationCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  static const NotificationCategory vocabulary = NotificationCategory(
    id: 'vocabulary',
    name: 'Vocabulary',
    description: 'To show vocabulary reminders for learning new words',
  );

  static const NotificationCategory dailyReminder = NotificationCategory(
    id: 'reminder',
    name: 'Daily Reminder',
    description: 'Nhắc nhở học từ mới',
  );
}
