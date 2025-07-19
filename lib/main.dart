import 'package:easy_english/core/navigation/app_router.dart';
import 'package:easy_english/core/theme/app_theme.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/entities/theme_entity.dart';
import 'package:easy_english/domain/usecases/init_data_topics_use_case.dart';
import 'package:easy_english/domain/usecases/init_data_use_case.dart';
import 'package:easy_english/presentation/features/notifications/bloc/reminder_cubit.dart';
import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'core/config/app_config.dart';
import 'data/datasources/notification/notification_data_source.dart';
import 'presentation/observers/my_bloc_observer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.setupDependencies();
  await di.getIt<NotificationDataSource>().initialize();
  Bloc.observer = MyBlocObserver();

  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => di.getIt<ThemeBloc>()..add(ThemeEvent.getTheme()),
        ),
        BlocProvider(create: (context) => di.getIt<ReminderCubit>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      await di.getIt<InitDataUseCase>().execute();
      await di.getIt<InitDataTopics>().execute();
    } catch (e) {
      app_config.printLog('e', 'Failed to initialize app: $e');
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontFamily = 'WorkSans';
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.getTheme(
                  state.themeEntity?.themeType == ThemeType.dark,
                ),
                themeMode: ThemeMode.system,
              );
            } else {
              return Container(); // Màn hình splash
            }
          },
        );
      },
    );
  }
}
