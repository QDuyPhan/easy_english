import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/grammar/screen/grammar_screen.dart';
import 'package:easy_english/presentation/features/home/screen/home_screen.dart';
import 'package:easy_english/presentation/features/home/widgets/home_navigation.dart';
import 'package:easy_english/presentation/features/settings/screen/settings_screen.dart';
import 'package:easy_english/presentation/features/studing/screen/studying_screen.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_bloc.dart';
import 'package:easy_english/presentation/features/topics/screen/topic_category_screen.dart';
import 'package:easy_english/presentation/features/topics/screen/topics_screen.dart';
import 'package:easy_english/presentation/features/translate/screen/translate_screen.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/screen/vocabulary_detail_screen.dart';
import 'package:easy_english/presentation/features/vocabulary/screen/vocabulary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

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
              BlocProvider(create: (context) => di.getIt<TopicsBloc>()),
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
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: HomeScreen(),
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
                path: RoutePaths.topics,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final folder = extra?['folder'] as String? ?? '';
                  final topic = extra?['topic'] as String? ?? '';
                  return SwipeablePage(
                    key: state.pageKey,
                    builder:
                        (context) => TopicsScreen(folder: folder, topic: topic),
                  );
                },
              ),
              GoRoute(
                path: RoutePaths.topicCategory,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final listCategory =
                      extra?['topics'] as MapEntry<String, List<String>>;
                  return SwipeablePage(
                    key: state.pageKey,
                    builder:
                        (context) =>
                            TopicCategoryScreen(topicEntry: listCategory),
                  );
                },
              ),
              GoRoute(
                path: RoutePaths.vocabularyDetails,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final word = extra?['word'] as WordEntity;
                  return SwipeablePage(
                    key: state.pageKey,
                    builder: (context) => VocabularyDetailScreen(word: word),
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
                path: RoutePaths.studying,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: StudyingScreen(),
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
