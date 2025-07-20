import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_english/domain/entities/theme_entity.dart';
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
              'Rocket App needs access to notifications to send you timely updates and reminders.',
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
                    'Thông báo',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  // subtitle: Text(
                  //   isDarkMode ? 'Dark Mode' : 'Light Mode',
                  //   style: textTheme.bodySmall?.copyWith(
                  //     color: colorScheme.onSurfaceVariant,
                  //   ),
                  // ),
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
              SizedBox(
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    _openTimePicker(context);
                  },
                  child: Text(
                    'Arabic Range Date Picker',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display selected day and time if a schedule is picked
                  if (isTimeSelected) ...[
                    CustomRichText(
                      title: 'Selected Day: ',
                      content: selectedNotificationDay,
                    ),
                    const SizedBox(height: 10),
                    CustomRichText(
                      title: 'Selected Time: ',
                      content: selectedTime.format(context),
                    ),
                    const SizedBox(height: 10),
                  ],
                  // Image.asset('assets/png/launcher.png'),
                  const SizedBox(height: 20),
                  // Buttons for various notification actions
                  CustomElevatedButton(
                    function: createBasicNotification,
                    title: 'Show Basic Notification',
                    icon: Icons.notifications,
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    function: triggerScheduleNotification,
                    title: 'Schedule Notification',
                    icon: Icons.schedule,
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    function: triggerCancelNotification,
                    title: 'Cancel All Scheduled Notifications',
                    icon: Icons.cancel,
                  ),
                ],
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
}
