import 'dart:math';

import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/presentation/features/home/bloc/daily_words_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/word_entity.dart';
import '../../search/blocs/search_bloc.dart';
import '../../vocabulary/blocs/vocabulary_bloc.dart';
import '../../vocabulary/blocs/vocabulary_event.dart';
import '../../vocabulary/blocs/vocabulary_state.dart';
import '../../vocabulary/widgets/word_card.dart';
import '../widgets/daily_word_section.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      context.read<DailyWordsBloc>().add(const GetDailyWordsEvent());
      context.read<VocabularyBloc>().add(const GetAllOxfordWords());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppbar(
        text: const Text('Easy English'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        leading: [
          Image.asset(
            Assets.pngLauncher,
            height: size.height * 0.05,
            width: size.width * 0.06,
          ),
        ],
        actions: [
          IconButton(
            onPressed: () => context.push(RoutePaths.search),
            icon: const Icon(FluentIcons.search_12_regular),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Stack(
          children: [
            Column(
              children: [
                SearchBox(controller: _searchController, debouncer: _debouncer),
                const SizedBox(height: 16),
                const DailyWordsSection(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Discover New Words 🔥',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context.push(RoutePaths.vocabulary),
                      child: const Text(
                        'See all',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<VocabularyBloc, VocabularyState>(
                    builder: (context, state) {
                      if (state is VocabularyLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is VocabularyError) {
                        return Center(child: Text(state.message));
                      } else if (state is VocabularyLoaded) {
                        final words = state.words;
                        final random = Random();

                        final shuffled = List<WordEntity>.from(words)
                          ..shuffle(random);

                        final randomItems = shuffled.take(10).toList();
                        return ListView.builder(
                          itemCount: randomItems.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WordCard(word: randomItems[index]);
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),

            Positioned.fill(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    success:
                        (final results) =>
                            results.isEmpty
                                ? const SizedBox.shrink()
                                : _buildSearchResultsOverlay(results),
                    noResults: () => const SizedBox.shrink(),
                    error: (message) => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultsOverlay(List<WordEntity> results) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 56 + 16),
          // 56 là height search box
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
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
                  word.senses.isNotEmpty ? word.senses.first.definition : '';
              return ListTile(
                title: Text(word.word),
                subtitle: Text(
                  def,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap:
                    () => context.push(
                      RoutePaths.wordDetails,
                      extra: {'word': word},
                    ),
              );
            },
          ),
        ),
      ),
    );
  }
}
