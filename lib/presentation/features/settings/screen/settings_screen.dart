import 'package:app_settings/app_settings.dart';
import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/notification_util.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../core/utils/widgets/request_notifications_permission_dialog.dart';
import '../../notifications/bloc/notifications_bloc.dart';
import '../widgets/settings_tile.dart';
import '../widgets/time_picker.dart';

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
                  SettingsTile(
                    icon: FluentIcons.alert_12_filled,
                    title: 'Reminder',
                    onTap:
                        isGrantedNotificationsPermission
                            ? _openTimePicker
                            : _openNotificationsSettings,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }



  void _openTimePicker() {
    Scaffold.of(context).showBottomSheet((BuildContext context) {
      return TimePicker();
    });
  }

  void _openNotificationsSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }
}
