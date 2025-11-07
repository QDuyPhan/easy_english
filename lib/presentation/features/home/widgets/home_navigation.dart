import 'package:easy_english/core/navigation/app_route_paths.dart';
import 'package:easy_english/core/utils/extensions/go_router_extension.dart';
import 'package:easy_english/presentation/features/common/dialog/translate_dialog.dart';
import 'package:easy_english/presentation/features/home/bloc/words_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/widgets/app_snack_bar.dart';
import '../../notifications/bloc/notifications_bloc.dart';

class HomeNavigation extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;

  static const routes = [
    AppRoutePaths.home,
    AppRoutePaths.dictionary,
    AppRoutePaths.grammar,
    AppRoutePaths.studying,
    AppRoutePaths.settings,
  ];

  static final List<IconData> icons = [
    FluentIcons.home_16_regular,
    FluentIcons.search_12_regular,
    FluentIcons.book_open_16_regular,
    FluentIcons.bookmark_16_regular,
    FluentIcons.settings_16_regular,
  ];

  static const labels = ["Home", "Search", "Grammar", "My Words", "Settings"];

  const HomeNavigation({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  late final AppLifecycleListener _appLifecycleListener;
  Offset fabPosition = const Offset(280, 650);

  @override
  void initState() {
    super.initState();
    final notificationsBloc = context.read<NotificationsBloc>();
    notificationsBloc.add(const NotificationsEvent.requestPermissions());
    notificationsBloc.add(
      const NotificationsEvent.handleOpenAppFromNotification(),
    );
    _appLifecycleListener = AppLifecycleListener(
      onShow: () {
        app_config.printLog('i', 'NotificationsScreen: onShow');
        notificationsBloc.add(const NotificationsEvent.requestPermissions());
      },
    );
  }

  void _onSelect(int value) {
    // if (value == HomeNavigation.routes.indexOf(RoutePaths.streak)) {
    //   context.read<NotificationsBloc>().add(
    //     const NotificationsEvent.getScheduledNotifications(),
    //   );
    // }
    widget.navigationShell.goBranch(value);
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    super.dispose();
  }

  Future<void> _showTranslationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return TranslateDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).currentRoute;
    final colorScheme = Theme.of(context).colorScheme;
    final selectedIndex = HomeNavigation.routes.indexOf(currentRoute);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bool showFab =
        [0, 1, 2, 3].contains(widget.navigationShell.currentIndex) &&
        HomeNavigation.routes.contains(
          widget.navigationShell.shellRouteContext.routerState.uri.path,
        );

    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            _handleError(context, state.failure);
            if (state.wordIdFromNotification != null) {
              context.go(
                AppRoutePaths.vocabulary,
                extra: {'wordId': state.wordIdFromNotification},
              );
            }
            if (state.message != null) {
              AppSnackBar.showSuccess(context, state.message!);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [Flexible(child: widget.navigationShell)],
              ),
            ),

            if (showFab)
              Positioned(
                left: fabPosition.dx,
                top: fabPosition.dy,
                child: Draggable(
                  feedback: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: colorScheme.primary.withOpacity(0.7),
                    foregroundColor: colorScheme.onPrimary,
                    child: const Icon(Icons.translate),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    setState(() {
                      final Size size = MediaQuery.sizeOf(context);
                      double newDx = details.offset.dx;
                      double newDy = details.offset.dy;

                      if (newDx < 0) newDx = 0;
                      if (newDy < 0) newDy = 0;

                      if (newDx > size.width - 56) newDx = size.width - 56;
                      if (newDy > size.height - 56) newDy = size.height - 56;

                      fabPosition = Offset(newDx, newDy);
                    });
                  },
                  child: FloatingActionButton(
                    onPressed: () {
                      final wordsBloc = context.read<WordsBloc>();
                      _showTranslationDialog(context);
                    },
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    elevation: 8.0,
                    tooltip: 'Dịch văn bản',
                    child: const Icon(Icons.translate),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex == -1 ? 0 : selectedIndex,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            selectedItemColor: colorScheme.primary,
            unselectedItemColor: Colors.grey[600]!,
            onTap: _onSelect,
            items: List.generate(
              HomeNavigation.labels.length,
              (index) => BottomNavigationBarItem(
                label: HomeNavigation.labels[index],
                icon: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color:
                        index == selectedIndex
                            ? colorScheme.primaryContainer
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      index == selectedIndex
                          ? colorScheme.primary
                          : Colors.grey[600]!,
                      BlendMode.srcIn,
                    ),
                    child: Icon(HomeNavigation.icons[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleError(BuildContext context, Failure? failure) {
    if (failure != null) {
      AppSnackBar.showError(context, failure.message);
    }
  }
}
