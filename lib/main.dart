import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/usecases/init_data_oxford_words_use_case.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'core/navigation/app_router.dart';
import 'core/navigation/route_paths.dart';
import 'core/utils/local_notifications_tools.dart';
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
    LocalNotificationsTools().init(
      onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse,
    ),
    di.getIt<InitDataOxfordWordsUseCase>().execute(),
    di.getIt<InitDataTopicsUseCase>().execute(),
  ]);

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.getIt<ThemeBloc>())],
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
}

void onDidReceiveNotificationResponse(
  NotificationResponse notificationResponse,
) {
  app_config.printLog(
    'i',
    'onDidReceiveNotificationResponse: ${notificationResponse.payload}',
  );
  final id = int.tryParse(notificationResponse.payload ?? '');
  AppRouter.navigatorKey.currentContext?.go(
    RoutePaths.vocabulary,
    extra: {'wordId': id},
  );
}

void onDidReceiveBackgroundNotificationResponse(
  NotificationResponse notificationResponse,
) {
  app_config.printLog(
    'i',
    'onDidReceiveBackgroundNotificationResponse: ${notificationResponse.payload}',
  );
  final id = int.tryParse(notificationResponse.payload ?? '');
  AppRouter.navigatorKey.currentContext?.go(
    RoutePaths.vocabulary,
    extra: {'wordId': id},
  );
}
