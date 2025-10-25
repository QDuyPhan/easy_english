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

  Future<String> _translate(String text, String from, String to) async {
    final GoogleTranslator translator = GoogleTranslator();

    try {
      final Translation translation = await translator.translate(
        text,
        from: from,
        to: to,
      );
      final String translatedText = translation.text;
      final String englishWord = (from == 'en') ? text : translatedText;
      final String vietnameseWord = (from == 'vi') ? text : translatedText;

      // if (from == 'en') {
      //   return englishWord;
      // } else {
      //   return vietnameseWord;
      // }
      return translatedText;
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
    String translationMode = 'en_vi';
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
                    // ## Dropdown chọn chiều dịch
                    DropdownButtonFormField<String>(
                      value: translationMode,
                      items: const [
                        DropdownMenuItem(
                          value: 'en_vi',
                          child: Text('Anh -> Việt'),
                        ),
                        DropdownMenuItem(
                          value: 'vi_en',
                          child: Text('Việt -> Anh'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          translationMode = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText:
                            translationMode == 'en_vi'
                                ? 'Nhập từ tiếng Anh...'
                                : 'Nhập từ tiếng Việt...',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (translatedText.isNotEmpty)
                      // ## Widget hiển-thị kết-quả
                      _buildResultWidget('', translationMode),
                    Text(translatedText),
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

                    final String from = translationMode.split('_')[0];
                    final String to = translationMode.split('_')[1];

                    final result = await _translate(textToTranslate, from, to);

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

  Widget _buildResultWidget(String result, String mode) {
    // final sourceWord = result.sourceWord;
    // final translatedWord = result.translatedWord;
    // final ipa = result.ipa;
    // final sourceAudioUrl = result.sourceAudioUrl;
    // final translatedAudioUrl = result.translatedAudioUrl;

    return BlocBuilder<WordsBloc, WordsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Từ gốc
              Row(
                children: [
                  Expanded(
                    child: Text(
                      state.dictionaries[0].word ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  if (result.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.volume_up, color: Colors.indigo),
                      onPressed: () => null,
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Từ dịch và phiên-âm
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // if (ipa != null)
                        //   Text(
                        //     '/$ipa/',
                        //     style: const TextStyle(
                        //       fontSize: 16,
                        //       fontStyle: FontStyle.italic,
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                  // if (translatedAudioUrl != null)
                  //   IconButton(
                  //     icon: const Icon(Icons.volume_up, color: Colors.indigo),
                  //     onPressed: () => _playAudio(translatedAudioUrl),
                  //   ),
                ],
              ),
            ],
          ),
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
                      _showTranslationDialog(context, wordsBloc);
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
