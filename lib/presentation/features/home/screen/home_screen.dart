import 'dart:math';

import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/widgets/custom_app_bar.dart';
import 'package:easy_english/presentation/features/home/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_route_name.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/app_text_field.dart';
import '../../../../domain/entities/word_entity.dart';
import '../../vocabulary/widgets/word_card.dart';
import '../widgets/pos_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer();
  final ScrollController _scrollController = ScrollController();
  late FocusNode _focusNode;
  static final Random random = Random();
  static final List<Color> availableColors = AppColor.listColor;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    Future.microtask(() {
      if (!mounted) return;
      context.read<VocabularyBloc>().add(const VocabularyEvent.getDictionary());
      context.read<VocabularyBloc>().add(const VocabularyEvent.getListWord());
    });
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     context.read<WordsBloc>().add(const WordsEvent.getListWord());
    //   }
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
          return CustomAppBar(
            title: 'Easy English',
            leading: [
              Image.asset(
                Assets.pngLauncher,
                height: size.height * 0.05,
                width: size.width * 0.06,
              ),
            ],
            actions: [
              IconButton(
                onPressed: () => context.push(AppRouteName.homeDetail),
                icon: const Icon(FluentIcons.search_12_filled),
              ),
            ],
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Learn more with Topic',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap:
                              () => context.pushNamed(
                                AppRouteName.homeDictionary,
                              ),
                          child: const Text(
                            'See all',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...state.dictionary
                            .take(3)
                            .toList()
                            .asMap()
                            .entries
                            .map((entry) {
                              final index = entry.key;
                              final dictItem = entry.value;
                              final color =
                                  availableColors[index %
                                      availableColors.length];
                              return InkWell(
                                onTap:
                                    () => context.pushNamed(
                                      AppRouteName.homeCategory,
                                      extra: {'topics': dictItem},
                                    ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          dictItem.image,
                                          height: 50.h,
                                          width: 70.w,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        dictItem.topic
                                            .replaceAll('_', " ")
                                            .toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: textTheme.bodySmall?.copyWith(
                                          color: colorScheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _searchController,
                  hint: 'Search words...',
                  prefixIcon: const Icon(Icons.search_rounded),
                  focusNode: _focusNode,
                  onChanged: (value) {
                    // if (value.trim().isEmpty) {
                    //   context.read<SearchBloc>().add(
                    //     const SearchEvent.clearSearch(),
                    //   );
                    //   return;
                    // }
                    //
                    // _debouncer.debounce(
                    //   duration: const Duration(milliseconds: 300),
                    //   onDebounce: () {
                    //     context.read<SearchBloc>().add(
                    //       SearchEvent.searchWords(query: value),
                    //     );
                    //   },
                    // );
                  },
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: _buildListWord(
                    state.words,
                    state,
                    colorScheme,
                    textTheme,
                    size,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListWord(
    List<WordEntity> words,
    VocabularyState state,
    ColorScheme colorScheme,
    TextTheme textTheme,
    Size size,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error.isNotEmpty) {
      return Center(child: Text(state.error));
    }
    return ListView.builder(
      controller: _scrollController,
      itemCount: words.length + 1,
      itemBuilder: (context, index) {
        if (index == words.length) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink();
        }
        return _buildWordCard(words[index], colorScheme, textTheme, size);
      },
    );
  }

  Widget _buildWordCard(
    WordEntity word,
    ColorScheme colorScheme,
    TextTheme textTheme,
    Size size,
  ) {
    return WordCard(word: word);
  }
}
