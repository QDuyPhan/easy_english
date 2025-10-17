import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/widgets/custom_app_bar.dart';
import 'package:easy_english/presentation/features/home/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/blocs/vocabulary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_route_name.dart';
import '../../../../core/utils/assets.dart';
import '../../../../domain/entities/word_entity.dart';
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

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
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
            child: Column(
              children: [
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
    if (state.isLoading && state.words.isEmpty) {
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
    final pos = word.pos.split(', ');
    return InkWell(
      onTap:
          () =>
              context.pushNamed(AppRouteName.homeDetail, extra: {'word': word}),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Text(
                    word.word ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: pos.map((p) => PosBadge(word: p)).toList(),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Phonetic(
                  backgroundColor: AppColor.jungleGreen,
                  phonetic: word.phonetic,
                  phoneticText: word.phoneticText,
                ),
                const SizedBox(width: 8),
                Phonetic(
                  backgroundColor: AppColor.strongBlue,
                  phonetic: word.phoneticAm,
                  phoneticText: word.phoneticAmText,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              word.senses.first.definition ?? '',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultsOverlay(List<WordEntity> results) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 56 + 16),
          // 56 là height search box
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: results.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final word = results[index];
              final def =
                  word.senses!.isNotEmpty ? word.senses?.first.definition : '';
              return ListTile(
                title: Text(
                  word.word ?? '',
                  style: theme.textTheme.titleMedium,
                ),
                subtitle: Text(
                  def ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () => null,
              );
            },
          ),
        ),
      ),
    );
  }
}

// body: GestureDetector(
//   onTap: () {
//     FocusScope.of(context).requestFocus(FocusNode());
//   },
//   child: Padding(
//     padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//     child: Stack(
//       children: [
//         Column(
//           children: [
//             SearchBox(
//               controller: _searchController,
//               debouncer: _debouncer,
//             ),
//             const SizedBox(height: 16),
//             const DailyWordsSection(),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 const Text(
//                   'Discover New Words 🔥',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () => context.push(RoutePaths.vocabulary),
//                   child: const Text(
//                     'See all',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: BlocBuilder<VocabularyBloc, VocabularyState>(
//                 builder: (context, state) {
//                   if (state is VocabularyLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (state is VocabularyError) {
//                     return Center(child: Text(state.message));
//                   } else if (state is VocabularyLoaded) {
//                     final words = state.words;
//                     final random = Random();
//
//                     final shuffled = List<WordEntity>.from(words)
//                       ..shuffle(random);
//
//                     final randomItems = shuffled.take(10).toList();
//                     return ListView.builder(
//                       itemCount: randomItems.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return WordCard(word: randomItems[index]);
//                       },
//                     );
//                   }
//                   return const SizedBox();
//                 },
//               ),
//             ),
//           ],
//         ),
//
//         Positioned.fill(
//           child: BlocBuilder<SearchBloc, SearchState>(
//             builder: (context, state) {
//               return state.when(
//                 initial: () => const SizedBox.shrink(),
//                 loading:
//                     () =>
//                         const Center(child: CircularProgressIndicator()),
//                 success:
//                     (final results) =>
//                         results.isEmpty
//                             ? const SizedBox.shrink()
//                             : _buildSearchResultsOverlay(results),
//                 noResults: () => const SizedBox.shrink(),
//                 error: (message) => const SizedBox.shrink(),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
