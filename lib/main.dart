import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/usecases/init_data_oxford_words_use_case.dart';
import 'package:easy_english/presentation/features/notifications/bloc/reminder_cubit.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'core/config/app_string.dart';
import 'core/theme/app_color.dart';
import 'core/utils/notification_util.dart';
import 'data/datasources/notification/notification_data_source.dart';
import 'domain/usecases/init_data_topics_use_case.dart';
import 'my_app.dart';
import 'presentation/observers/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  HydratedBloc.storage = storage;

  await setupCoreDependencies();

  await Future.wait([
    di.getIt<InitDataOxfordWordsUseCase>().execute(),
    di.getIt<InitDataTopicsUseCase>().execute(),
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.getIt<ThemeBloc>()),
        BlocProvider(create: (context) => di.getIt<ReminderCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> setupCoreDependencies() async {
  Bloc.observer = MyBlocObserver();

  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));

  await di.setupDependencies();

  try {
    await di.getIt<NotificationDataSource>().initialize();
  } catch (e) {
    print('Error initializing notification data source: $e');
  }

  // Initialize AwesomeNotifications
  // try {
  //   await NotificationUtil(awesomeNotifications: null).initializeNotifications();
  // } catch (e) {
  //   print('Error initializing AwesomeNotifications: $e');
  // }

  // await AwesomeNotifications().initialize('resource://drawable/launcher', [
  //   NotificationChannel(
  //     channelKey: AppStrings.BASIC_CHANNEL_KEY,
  //     channelName: AppStrings.BASIC_CHANNEL_NAME,
  //     channelDescription: AppStrings.BASIC_CHANNEL_DESCRIPTION,
  //     defaultColor: AppColor.lightPrimary,
  //     importance: NotificationImportance.High,
  //     defaultRingtoneType: DefaultRingtoneType.Notification,
  //   ),
  //   NotificationChannel(
  //     channelKey: AppStrings.SCHEDULE_CHANNEL_KEY,
  //     channelName: AppStrings.SCHEDULE_CHANNEL_NAME,
  //     channelDescription: AppStrings.SCHEDULE_CHANNEL_DESCRIPTION,
  //     defaultColor: AppColor.lightPrimary,
  //     importance: NotificationImportance.High,
  //     defaultRingtoneType: DefaultRingtoneType.Notification,
  //   ),
  // ], debug: false);
}
