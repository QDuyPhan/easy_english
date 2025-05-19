import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/presentation/features/home/screen/home_screen.dart';
import 'package:easy_english/presentation/features/home/widgets/home_navigation.dart';
import 'package:easy_english/presentation/features/profile/screen/profile_screen.dart';
import 'package:easy_english/presentation/features/settings/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final router = GoRouter(
    initialLocation: RoutePaths.home,
    navigatorKey: navigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
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
        ],
        builder: (context, state, navigationShell) {
          return HomeNavigation(state: state, navigationShell: navigationShell);
        },
      ),
    ],
  );
}
