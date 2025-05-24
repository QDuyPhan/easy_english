import 'package:device_preview/device_preview.dart';
import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/navigation/app_router.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/usecases/init_data_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.setupDependencies();
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  void initializeApp() async {
    app_config.printLog('i', 'pasuing...');
    await di.getIt<InitDataUseCase>().execute();
    app_config.printLog('i', 'unpasuing...');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
