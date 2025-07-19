import 'package:easy_english/domain/entities/reminder.dart';
import 'package:easy_english/domain/usecases/schedule_notification_use_case.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/cancel_notification_use_case.dart';

@injectable
class ReminderCubit extends HydratedCubit<Reminder> {
  final ScheduleNotificationUseCase _scheduleNotificationUseCase;
  final CancelNotificationUseCase _cancelNotificationUseCase;

  ReminderCubit(
    ScheduleNotificationUseCase scheduleNotificationUseCase,
    CancelNotificationUseCase cancelNotificationUseCase,
  ) : _scheduleNotificationUseCase = scheduleNotificationUseCase,
      _cancelNotificationUseCase = cancelNotificationUseCase,
      super(
        Reminder(
          enabled: false,
          hour: 20,
          minute: 0,
          title: "Nhắc nhở học tập",
          body: "Đừng quên ôn từ mới hôm nay nhé!",
        ),
      );

  void toggle(bool enabled) async {
    emit(state.copyWith(enabled: enabled));
    if (enabled) {
      await scheduleCurrent();
    } else {
      await _cancelNotificationUseCase.call(0);
    }
  }

  void updateTime(int hour, int minute) async {
    emit(state.copyWith(hour: hour, minute: minute));
    if (state.enabled) {
      await scheduleCurrent();
    }
  }

  void updateTitle(String title) => emit(state.copyWith(title: title));

  void updateBody(String body) => emit(state.copyWith(body: body));

  Future<void> scheduleCurrent() async =>
      await _scheduleNotificationUseCase.call(
        hour: state.hour,
        minute: state.minute,
        title: state.title,
        body: state.body,
      );

  @override
  Reminder? fromJson(Map<String, dynamic> json) => Reminder.fromJson(json);

  @override
  Map<String, dynamic>? toJson(Reminder state) {
    return {
      'enabled': state.enabled,
      'hour': state.hour,
      'minute': state.minute,
      'title': state.title,
      'body': state.body,
    };
  }
}
