class Reminder {
  final bool enabled;
  final int hour;
  final int minute;
  final String title;
  final String body;

  Reminder({
    required this.enabled,
    required this.hour,
    required this.minute,
    required this.title,
    required this.body,
  });

  Reminder copyWith({
    bool? enabled,
    int? hour,
    int? minute,
    String? title,
    String? body,
  }) {
    return Reminder(
      enabled: enabled ?? this.enabled,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
