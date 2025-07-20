import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../presentation/features/settings/screen/stats_page.dart';
import '../config/app_string.dart';
import '../theme/app_color.dart';

class NotificationUtil {
  final AwesomeNotifications awesomeNotifications;

  NotificationUtil({required this.awesomeNotifications});

  /// Creates a basic notification that appears immediately.
  Future<void> createBasicNotification({
    required int id,
    required String channelKey,
    required String title,
    required String body,
    String bigPicture = AppStrings.DEFAULT_ICON,
    NotificationLayout layout = NotificationLayout.BigPicture,
  }) async {
    awesomeNotifications.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
        bigPicture: bigPicture,
        notificationLayout: layout,
      ),
    );
  }

  /// Creates a scheduled notification that will appear at a specific time and can repeat.
  Future<void> createScheduledNotification({
    required int id,
    required String channelKey,
    required String title,
    required String body,
    String bigPicture = AppStrings.DEFAULT_ICON,
    NotificationLayout layout = NotificationLayout.BigPicture,
    required NotificationCalendar notificationCalendar,
  }) async {
    awesomeNotifications.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
        bigPicture: bigPicture,
        notificationLayout: layout,
      ),
      actionButtons: [
        NotificationActionButton(
          key: AppStrings.SCHEDULED_NOTIFICATION_BUTTON1_KEY,
          label: 'Mark Done',
        ),
        NotificationActionButton(
          key: AppStrings.SCHEDULED_NOTIFICATION_BUTTON2_KEY,
          label: 'Clear',
        ),
      ],
      schedule: NotificationCalendar(
        weekday: notificationCalendar.weekday,
        hour: notificationCalendar.hour,
        minute: notificationCalendar.minute,
        repeats:
            true, // This notification will repeat every week on the specified day and time.
      ),
    );
  }

  /// Cancels all currently scheduled notifications.
  void cancelAllScheduledNotifications({required BuildContext context}) {
    awesomeNotifications.cancelAllSchedules().then(
      (value) => {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cancelled all scheduled notifications'),
            backgroundColor: AppColor.lightPrimary,
          ),
        ),
      },
    );
  }

  /// Requests permission from the user to send notifications. This is crucial for Android 13+ and iOS.
  void requestPermissionToSendNotifications({required BuildContext context}) {
    AwesomeNotifications().requestPermissionToSendNotifications().then((value) {
      // After requesting permission, pop the dialog that prompted the user.
      Navigator.of(context).pop();
    });
  }

  /// Static methods for handling notification lifecycle events.
  /// These methods are marked with `@pragma("vm:entry-point")` to ensure they are accessible
  /// even when the application is running in the background or killed.

  /// Use this method to detect when a new notification or a schedule is created.
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
    BuildContext context,
  ) async {
    // Show a SnackBar to indicate that a notification has been created.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Notification created ${receivedNotification.channelKey}',
        ),
        backgroundColor: AppColor.lightPrimary,
      ),
    );
  }

  /// Use this method to detect every time that a new notification is displayed.
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code to handle a notification being displayed can go here.
    // For example, you might log the event or update a UI element.
  }

  /// Use this method to detect if the user dismissed a notification.
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Your code to handle a notification being dismissed can go here.
    // This is useful for tracking user interaction or cleaning up resources.
  }

  /// Use this method to detect when the user taps on a notification or an action button within it.
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Reducing icon badge count on iOS when a basic notification is tapped/acted upon.
    // This is important for maintaining accurate badge counts.
    if (receivedAction.channelKey == AppStrings.BASIC_CHANNEL_KEY &&
        Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then((value) {
        AwesomeNotifications().setGlobalBadgeCounter(value - 1);
      });
    }

    // Navigating to the StatsPage when any notification action is received.
    // The `navigatorKey` from `MyApp` is used to navigate from anywhere in the app.
    MyApp.navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const StatsPage()),
      (route) => route.isFirst,
    );
  }
}
