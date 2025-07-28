import 'package:easy_english/presentation/features/theme/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/app_config.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'data/models/theme_type.dart';

class MyApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeBloc>().add(const ThemeEvent.getTheme());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        app_config.printLog(
          'i',
          '🌗 Theme Entity: ${state.themeEntity?.themeType}',
        );
        final themeMode =
            state.themeEntity == null
                ? ThemeMode.system
                : state.themeEntity!.themeType == ThemeType.dark
                ? ThemeMode.dark
                : ThemeMode.light;

        return MaterialApp.router(
          key: MyApp.navigatorKey,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(false),
          darkTheme: AppTheme.getTheme(true),
          themeMode: themeMode,
        );
      },
    );
  }
}
