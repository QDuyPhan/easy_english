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



  @override
  Reminder? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(Reminder state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
