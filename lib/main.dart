import 'package:easy_english/core/navigation/app_router.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/usecases/init_data_usecase.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencies();
  await di.getIt<InitDataUseCase>().execute();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
