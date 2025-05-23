import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/home/screen/home_screen.dart';
import 'package:easy_english/presentation/features/home/widgets/home_navigation.dart';
import 'package:easy_english/presentation/features/profile/screen/profile_screen.dart';
import 'package:easy_english/presentation/features/settings/screen/settings_screen.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/screen/vocabulary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final router = GoRouter(
    initialLocation: RoutePaths.home,
    navigatorKey: navigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di.getIt<VocabularyBloc>()),
            ],
            child: HomeNavigation(
              state: state,
              navigationShell: navigationShell,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.vocabulary,
                builder: (context, state) => const VocabularyScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(child: Text('Page not found: ${state.error}')),
        ),
  );
}
