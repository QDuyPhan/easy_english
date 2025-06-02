import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/grammar/screen/grammar_screen.dart';
import 'package:easy_english/presentation/features/home/screen/home_screen.dart';
import 'package:easy_english/presentation/features/home/widgets/home_navigation.dart';
import 'package:easy_english/presentation/features/settings/screen/settings_screen.dart';
import 'package:easy_english/presentation/features/topics/screen/topics_screen.dart';
import 'package:easy_english/presentation/features/translate/screen/translate_screen.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/screen/vocabulary_detail_screen.dart';
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
                pageBuilder: (context, state) {
                  // final extra = state.extra as Map<String, dynamic>?;
                  // final word = extra?['word'] as WordEntity;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: HomeScreen(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    transitionDuration: Duration(milliseconds: 500),
                  );
                },
              ),
              GoRoute(
                path: RoutePaths.vocabulary,
                pageBuilder: (context, state) {
                  // final extra = state.extra as Map<String, dynamic>?;
                  // final word = extra?['word'] as WordEntity;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: VocabularyScreen(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    transitionDuration: Duration(milliseconds: 500),
                  );
                },
              ),
              GoRoute(
                path: RoutePaths.vocabularyDetails,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final word = extra?['word'] as WordEntity;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    opaque: false,
                    child: VocabularyDetailScreen(word: word),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = Offset(1.0, 0.0); // Trượt từ phải sang trái
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      final tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      final offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(
                          opacity: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                          child: child,
                        ),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.translate,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: TranslateScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      transitionDuration: Duration(milliseconds: 500),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.grammar,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: GrammarScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      transitionDuration: Duration(milliseconds: 500),
                    ),
              ),
            ],
          ),

          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: RoutePaths.home,
          //       pageBuilder:
          //           (context, state) => CustomTransitionPage(
          //             key: state.pageKey,
          //             child: HomeScreen(),
          //             transitionsBuilder: (
          //               context,
          //               animation,
          //               secondaryAnimation,
          //               child,
          //             ) {
          //               return FadeTransition(opacity: animation, child: child);
          //             },
          //             transitionDuration: Duration(milliseconds: 500),
          //           ),
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.topics,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: TopicsScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      transitionDuration: Duration(milliseconds: 500),
                    ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: SettingsScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      transitionDuration: Duration(milliseconds: 500),
                    ),
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
