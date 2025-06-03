import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/navigation/app_router.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/usecases/init_data_topics.dart';
import 'package:easy_english/domain/usecases/init_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/services.dart';

import 'core/config/app_config.dart';
import 'presentation/observers/my_bloc_observer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, // Cho phép background kéo lên tận status bar
      statusBarIconBrightness:
          Brightness.dark, // Đổi thành light nếu status bar tối
    ),
  );
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.setupDependencies();
  Bloc.observer = MyBlocObserver();
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
  runApp(MyApp());
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
    final fontFamily = 'SF Pro Display';
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.primary100,
                brightness: Brightness.light,
                surface: Colors.white,
              ),
              textTheme: TextTheme().apply(fontFamily: fontFamily),
            ),
          );
        } else {
          return Container(color: Colors.white); // Màn hình splash
        }
      },
    );
  }
}
