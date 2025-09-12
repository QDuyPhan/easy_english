import 'package:app_settings/app_settings.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/notification_util.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../notifications/bloc/notifications_bloc.dart';
import '../widgets/settings_tile.dart';

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
      // createScheduleNotification();
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final isGrantedNotificationsPermission =
        context.watch<NotificationsBloc>().state.isNotificationsGranted;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeEntity?.themeType == ThemeType.dark;

        return Scaffold(
          backgroundColor: colorScheme.background,
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
              Column(
                children: [
                  SettingsTile(icon: Icons.phone_outlined, title: 'Contact Us'),
                  SettingsTile(icon: Icons.menu_book_outlined, title: 'About Us'),
                  SettingsTile(icon: Icons.star_border_rounded, title: 'Rate Us'),

                  if (!isGrantedNotificationsPermission)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: _openNotificationsSettings,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: colorScheme.primary.withOpacity(0.8),
                              ),
                              Text('Enable Notifications'),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              // BlocBuilder<ReminderCubit, Reminder>(
              //   builder: (context, reminderState) {
              //     return Padding(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 20,
              //         vertical: 12,
              //       ),
              //       child: Column(
              //         children: [
              //           ReminderTile(
              //             enabled: reminderState.enabled,
              //             hour: reminderState.hour,
              //             minute: reminderState.minute,
              //             onToggle: (value) async {
              //               try {
              //                 context.read<ReminderCubit>().toggle(value);
              //                 ScaffoldMessenger.of(context).showSnackBar(
              //                   SnackBar(
              //                     content: Text(
              //                       value
              //                           ? 'Đã bật nhắc nhở học từ hàng ngày'
              //                           : 'Đã tắt nhắc nhở học từ',
              //                     ),
              //                     backgroundColor:
              //                         value
              //                             ? Theme.of(
              //                               context,
              //                             ).colorScheme.primary
              //                             : Theme.of(
              //                               context,
              //                             ).colorScheme.outline,
              //                   ),
              //                 );
              //               } catch (e) {
              //                 // xử lý lỗi như bạn đã làm
              //               }
              //             },
              //             onTapTime:
              //                 () =>
              //                     _showTimePickerDialog(context, reminderState),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }

  void _openNotificationsSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  void _openTimePicker(BuildContext context) {
    BottomPicker.time(
      pickerTitle: Text(
        'Set your next meeting time',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.orange),
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

  // void _showTimePickerDialog(
  //   BuildContext context,
  //   Reminder reminderState,
  // ) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay(
  //       hour: reminderState.hour,
  //       minute: reminderState.minute,
  //     ),
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           timePickerTheme: TimePickerThemeData(
  //             backgroundColor: Theme.of(context).colorScheme.surface,
  //             hourMinuteTextColor: Theme.of(context).colorScheme.onSurface,
  //             hourMinuteColor: Theme.of(context).colorScheme.primaryContainer,
  //             dialHandColor: Theme.of(context).colorScheme.primary,
  //             dialBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   // if (pickedTime != null) {
  //   //   context.read<ReminderCubit>().updateTime(
  //   //     pickedTime.hour,
  //   //     pickedTime.minute,
  //   //   );
  //   // }
  // }
}
