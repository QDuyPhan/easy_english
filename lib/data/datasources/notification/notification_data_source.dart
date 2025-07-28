import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../core/constants/notification_category.dart';

abstract class NotificationDataSource {
  Future<void> initialize();

  Future<bool> requestPermissions();

  Future<bool> areNotificationsEnabled();

  Future<List<PendingNotificationRequest>> getPendingNotifications();

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationCategory category,
    required String threadIdentifier,
    String? payload,
  });

  Future<void> cancelNotification(int id);

  Future<void> scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required NotificationCategory category,
    required String threadIdentifier,
    String? payload,
  });
}

@LazySingleton(as: NotificationDataSource)
class NotificationDataSourceImpl implements NotificationDataSource {
  NotificationDataSourceImpl();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> cancelNotification(int id) async {
    try {
      await flutterLocalNotificationsPlugin.cancel(id);
    } catch (e) {
      if (kDebugMode) {
        print('Error canceling notification: $e');
      }
    }
  }

  @override
  Future<void> initialize() async {
    try {
      final android = AndroidInitializationSettings('launcher');
      final ios = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
      final settings = InitializationSettings(android: android, iOS: ios);
      await flutterLocalNotificationsPlugin.initialize(settings);
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing notifications: $e');
      }
    }
  }

  @override
  Future<bool> requestPermissions() async {
    try {
      final android =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      final ios =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >();

      bool granted = true;

      if (android != null) {
        granted = await android.requestNotificationsPermission() ?? false;
      }

      if (ios != null) {
        granted =
            await ios.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            ) ??
            false;
      }

      return granted;
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting notification permissions: $e');
      }
      return false;
    }
  }

  @override
  Future<bool> areNotificationsEnabled() async {
    try {
      final android =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      final ios =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >();

      bool enabled = true;

      if (android != null) {
        enabled = await android.areNotificationsEnabled() ?? false;
      }

      if (ios != null) {
        // For iOS, we assume notifications are enabled if we can request permissions
        enabled = enabled && true;
      }

      return enabled;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking notification status: $e');
      }
      return false;
    }
  }

  @override
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    try {
      return await flutterLocalNotificationsPlugin
          .pendingNotificationRequests();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting pending notifications: $e');
      }
      return [];
    }
  }

  @override
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationCategory category,
    required String threadIdentifier,
    String? payload,
  }) async {
    try {
      final androidDetails = AndroidNotificationDetails(
        category.id,
        category.name,
        channelDescription: category.description,
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        enableVibration: true,
        playSound: true,
        enableLights: true,
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000, // LED on for 1 second
        ledOffMs: 1000, // LED off for 1 second
      );
      final iosDetails = DarwinNotificationDetails(
        categoryIdentifier: category.id,
        threadIdentifier: threadIdentifier,
      );
      final details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error scheduling notification: $e');
      }
      rethrow;
    }
  }

  @override
  Future<void> scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required NotificationCategory category,
    required String threadIdentifier,
    String? payload,
  }) async {
    try {
      final androidDetails = AndroidNotificationDetails(
        category.id,
        category.name,
        channelDescription: category.description,
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        playSound: true,
        enableLights: true,
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000, // LED on for 1 second
        ledOffMs: 1000, // LED off for 1 second
      );
      final iosDetails = DarwinNotificationDetails(
        categoryIdentifier: category.id,
        threadIdentifier: threadIdentifier,
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      final details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      // Calculate the next occurrence of the specified time
      final now = DateTime.now();
      var scheduledDate = DateTime(now.year, now.month, now.day, hour, minute);

      // If the time has already passed today, schedule for tomorrow
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      if (kDebugMode) {
        print('Scheduling daily reminder:');
        print('  - Current time: ${now.toIso8601String()}');
        print('  - Scheduled time: ${scheduledDate.toIso8601String()}');
        print('  - Time zone: ${tz.local.name}');
        print('  - Notification ID: $id');
        print('  - Title: $title');
        print('  - Body: $body');
      }

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents:
            DateTimeComponents.time, // repeat daily at time
        payload: payload,
      );

      if (kDebugMode) {
        print('Daily reminder scheduled successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error scheduling daily reminder: $e');
      }
      rethrow;
    }
  }
}
