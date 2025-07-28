import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_english/domain/entities/reminder.dart';
import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/presentation/features/notifications/bloc/reminder_cubit.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/create_uid.dart';
import '../../../../core/utils/notification_util.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/custom_rich_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedNotificationDay = '';
  int selectedDayOfTheWeek = 0;
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isTimeSelected = false;
  late NotificationUtil notificationUtil;

  // list of notification days
  final List<String> notificationDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thur',
    'Fri',
    'Sat',
    'Sun',
  ];

  // Function to create a basic notification
  void createBasicNotification() {
    notificationUtil.createBasicNotification(
      id: createUniqueId(),
      // Get a unique ID for this notification
      channelKey: AppStrings.BASIC_CHANNEL_KEY,
      title:
          '${Emojis.clothing_backpack + Emojis.transport_air_airplane} Network Call',
      body:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur',
      bigPicture: 'asset://assets/png/launcher.png', // Display a large image
    );
  }

  // Function to trigger cancellation of all scheduled notifications
  void triggerCancelNotification() {
    notificationUtil.cancelAllScheduledNotifications(context: context);
  }

  // Function to initiate the scheduling process by showing a day selection dialog
  void triggerScheduleNotification() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Show Notification Every'),
            content: Wrap(
              spacing: 3.0,
              runSpacing: 8.0,
              children:
                  notificationDays
                      .asMap()
                      .entries
                      .map(
                        (day) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.lightSecondary,
                          ),
                          onPressed: () {
                            int index = day.key;
                            setState(() {
                              selectedNotificationDay = day.value;
                              selectedDayOfTheWeek =
                                  index +
                                  1; // Weekday is 1-indexed (Sunday is 1, Monday is 2, etc.)
                            });
                            Navigator.of(
                              context,
                            ).pop(); // Close day selection dialog
                            pickTime(); // Then, prompt for time selection
                          },
                          child: Text(
                            day.value,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
    );
  }

  // Function to create the actual scheduled notification after day and time are selected
  void createScheduleNotification() {
    notificationUtil.createScheduledNotification(
      id: createUniqueId(),
      channelKey: AppStrings.SCHEDULE_CHANNEL_KEY,
      title: '${Emojis.time_alarm_clock} Check your rocket!',
      body:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur',
      layout: NotificationLayout.Default,
      notificationCalendar: NotificationCalendar(
        hour: selectedTime.hour,
        minute: selectedTime.minute,
        weekday: selectedDayOfTheWeek, // Use the selected day of the week
      ),
    );
  }

  // Function to show a time picker dialog
  Future<TimeOfDay?> pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        isTimeSelected = true;
      });
      createScheduleNotification(); // Once time is picked, create the notification
    }
    return null;
  }

  // Function to request notification permissions
  void requestPermission() {
    notificationUtil.requestPermissionToSendNotifications(context: context);
  }

  @override
  void initState() {
    super.initState();

    // Check notification permission and prompt if not allowed
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        customAlertDialog(
          title: 'Allow notifications',
          content:
              'Easy English needs access to notifications to send you daily reminders for learning new words.',
          context: context,
          action: requestPermission,
          button1Title: 'Allow',
          button2Title: 'Don\'t Allow',
        );
      }
    });

    // Initialize NotificationUtil with an instance of AwesomeNotifications
    notificationUtil = NotificationUtil(
      awesomeNotifications: AwesomeNotifications(),
    );

    // Set up listeners for various notification events
    AwesomeNotifications().setListeners(
      onNotificationCreatedMethod:
          (notification) async => NotificationUtil.onNotificationCreatedMethod(
            notification,
            context,
          ),
      onActionReceivedMethod: NotificationUtil.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          (ReceivedAction receivedAction) =>
              NotificationUtil.onDismissActionReceivedMethod(receivedAction),
      onNotificationDisplayedMethod:
          (ReceivedNotification receivedNotification) =>
              NotificationUtil.onNotificationDisplayedMethod(
                receivedNotification,
              ),
    );
  }

  @override
  void dispose() {
    // Dispose of AwesomeNotifications resources when the widget is removed
    AwesomeNotifications().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeEntity?.themeType == ThemeType.dark;

        return Scaffold(
          appBar: CustomAppbar(
            text: Text('Settings'),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: 'Toggle Theme',
                onPressed: () {
                  context.read<ThemeBloc>().add(const ThemeEvent.toggleTheme());
                },
                icon: Icon(
                  isDarkMode
                      ? FluentIcons.weather_moon_16_regular
                      : FluentIcons.weather_sunny_16_regular,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: colorScheme.outlineVariant),
                  ),
                  tileColor: colorScheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    'App Theme',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  trailing: Switch.adaptive(
                    value: isDarkMode,
                    onChanged: (_) {
                      context.read<ThemeBloc>().add(
                        const ThemeEvent.toggleTheme(),
                      );
                    },
                    activeColor: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ReminderCubit, Reminder>(
                builder: (context, reminderState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: colorScheme.outlineVariant),
                          ),
                          tileColor: colorScheme.surface,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          title: Text(
                            'Nhắc nhở học từ',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          subtitle: Text(
                            reminderState.enabled
                                ? 'Nhắc nhở hàng ngày lúc ${reminderState.hour.toString().padLeft(2, '0')}:${reminderState.minute.toString().padLeft(2, '0')}'
                                : 'Tắt nhắc nhở',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          trailing: Switch.adaptive(
                            value: reminderState.enabled,
                            onChanged: (value) async {
                              try {
                                context.read<ReminderCubit>().toggle(value);
                                if (value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Đã bật nhắc nhở học từ hàng ngày',
                                      ),
                                      backgroundColor: colorScheme.primary,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Đã tắt nhắc nhở học từ'),
                                      backgroundColor: colorScheme.outline,
                                    ),
                                  );
                                }
                              } catch (e) {
                                String errorMessage =
                                    'Không thể ${value ? 'bật' : 'tắt'} nhắc nhở';
                                if (e.toString().contains('permission')) {
                                  errorMessage =
                                      'Cần cấp quyền thông báo để sử dụng tính năng này';
                                } else if (e.toString().contains(
                                  'invalid_led_details',
                                )) {
                                  errorMessage =
                                      'Lỗi cấu hình thông báo. Vui lòng thử lại.';
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                    backgroundColor: colorScheme.error,
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }
                            },
                            activeColor: colorScheme.primary,
                          ),
                        ),
                        if (reminderState.enabled) ...[
                          const SizedBox(height: 12),
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            tileColor: colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            title: Text(
                              'Thời gian nhắc nhở',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            subtitle: Text(
                              '${reminderState.hour.toString().padLeft(2, '0')}:${reminderState.minute.toString().padLeft(2, '0')}',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            trailing: Icon(
                              Icons.access_time_rounded,
                              color: colorScheme.primary,
                            ),
                            onTap: () async {
                              try {
                                _showTimePickerDialog(context, reminderState);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Đã cập nhật thời gian nhắc nhở',
                                    ),
                                    backgroundColor: colorScheme.primary,
                                  ),
                                );
                              } catch (e) {
                                String errorMessage =
                                    'Không thể cập nhật thời gian';
                                if (e.toString().contains('permission')) {
                                  errorMessage =
                                      'Cần cấp quyền thông báo để sử dụng tính năng này';
                                } else if (e.toString().contains(
                                  'invalid_led_details',
                                )) {
                                  errorMessage =
                                      'Lỗi cấu hình thông báo. Vui lòng thử lại.';
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                    backgroundColor: colorScheme.error,
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            tileColor: colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            title: Text(
                              'Test thông báo',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            subtitle: Text(
                              'Gửi thông báo test ngay lập tức',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            trailing: Icon(
                              Icons.notifications_active_rounded,
                              color: colorScheme.primary,
                            ),
                            onTap: () async {
                              try {
                                notificationUtil.createBasicNotification(
                                  id: createUniqueId(),
                                  channelKey: AppStrings.BASIC_CHANNEL_KEY,
                                  title: 'Test thông báo',
                                  body: 'Thông báo test từ Easy English',
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Đã gửi thông báo test'),
                                    backgroundColor: colorScheme.primary,
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Không thể gửi thông báo test: ${e.toString()}',
                                    ),
                                    backgroundColor: colorScheme.error,
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            tileColor: colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            title: Text(
                              'Kiểm tra trạng thái',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            subtitle: Text(
                              'Xem thông tin thông báo đã lên lịch',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            trailing: Icon(
                              Icons.info_outline_rounded,
                              color: colorScheme.primary,
                            ),
                            onTap: () => _checkNotificationStatus(context),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openTimePicker(BuildContext context) {
    BottomPicker.time(
      pickerTitle: Text(
        'Set your next meeting time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.orange,
        ),
      ),
      use24hFormat: false,
      onSubmit: (index) {
        print(index);
      },
      onCloseButtonPressed: () {
        print('Picker closed');
      },
      bottomPickerTheme: BottomPickerTheme.orange,
      initialTime: Time(minutes: 23),
      maxTime: Time(hours: 17),
    ).show(context);
  }

  void _showTimePickerDialog(
    BuildContext context,
    Reminder reminderState,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: reminderState.hour,
        minute: reminderState.minute,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Theme.of(context).colorScheme.surface,
              hourMinuteTextColor: Theme.of(context).colorScheme.onSurface,
              hourMinuteColor: Theme.of(context).colorScheme.primaryContainer,
              dialHandColor: Theme.of(context).colorScheme.primary,
              dialBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      context.read<ReminderCubit>().updateTime(
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }

  void _checkNotificationStatus(BuildContext context) async {
    try {
      final notificationsEnabled =
          await notificationUtil.awesomeNotifications.isNotificationAllowed();
      final pendingNotifications =
          await notificationUtil.awesomeNotifications
              .listScheduledNotifications();

      String statusMessage = 'Trạng thái thông báo:\n';
      statusMessage +=
          '• Quyền thông báo: ${notificationsEnabled ? 'Đã cấp' : 'Chưa cấp'}\n';
      statusMessage +=
          '• Số thông báo đã lên lịch: ${pendingNotifications.length}\n';

      if (pendingNotifications.isNotEmpty) {
        statusMessage += '\nThông báo đã lên lịch:\n';
        for (var notification in pendingNotifications) {
          statusMessage +=
              '• ID: ${notification.content?.id}, Title: ${notification.content?.title}\n';
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(statusMessage),
          backgroundColor: Theme.of(context).colorScheme.primary,
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không thể kiểm tra trạng thái: ${e.toString()}'),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
