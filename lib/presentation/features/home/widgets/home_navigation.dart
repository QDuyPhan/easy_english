import 'package:easy_english/core/navigation/app_route_paths.dart';
import 'package:easy_english/core/utils/extensions/go_router_extension.dart';
import 'package:easy_english/presentation/features/home/bloc/words_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:translator/translator.dart';

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

  Future<String> _translate(String text) async {
    final translator = GoogleTranslator();

    try {
      final translation = await translator.translate(
        text,
        from: 'en',
        to: 'vi',
      );
      return translation.text;
    } catch (e) {
      return 'Đã xảy ra lỗi khi dịch. Vui lòng thử lại.';
    }
  }

  Future<void> _showTranslationDialog(
    BuildContext context,
    WordsBloc wordsBloc,
  ) async {
    final textController = TextEditingController();
    String translatedText = '';
    bool isLoading = false;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Translate'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Nhập từ tiếng Anh...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (translatedText.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          translatedText,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Hủy'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('Dịch'),
                  onPressed: () async {
                    final textToTranslate = textController.text;
                    if (textToTranslate.isEmpty) {
                      return;
                    }

                    setState(() {
                      isLoading = true;
                      translatedText = '';
                    });

                    final result = await _translate(textToTranslate);

                    setState(() {
                      translatedText = result;
                      isLoading = false;
                    });
                    if (mounted) {
                      wordsBloc.add(
                        WordsEvent.translateWord(textController.text),
                      );
                    }
                  },
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).currentRoute;
    final colorScheme = Theme.of(context).colorScheme;
    final selectedIndex = HomeNavigation.routes.indexOf(currentRoute);
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
        body: SafeArea(
          child: Column(children: [Flexible(child: widget.navigationShell)]),
        ),
        floatingActionButton:
            [0, 1, 2, 3].contains(widget.navigationShell.currentIndex) &&
                    HomeNavigation.routes.contains(
                      widget
                          .navigationShell
                          .shellRouteContext
                          .routerState
                          .uri
                          .path,
                    )
                ? FloatingActionButton(
                  onPressed: () {
                    final wordsBloc = context.read<WordsBloc>();
                    _showTranslationDialog(context, wordsBloc);
                  },
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 8.0,
                  tooltip: 'Dịch văn bản',
                  child: const Icon(Icons.translate),
                )
                : null,

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
