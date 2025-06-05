import 'package:easy_english/core/utils/widgets/base_screen.dart';
import 'package:easy_english/core/utils/widgets/custom_flashcards.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/topics/blocs/topics_event.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_state.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/search_box.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/topics_bloc.dart';

class TopicsScreen extends StatefulWidget {
  final String folder;
  final String topic;

  const TopicsScreen({super.key, required this.folder, required this.topic});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  bool _showSearch = false;
  int _curIndexNum = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:
          di.getIt<TopicsBloc>()
            ..add(GetTopic(folder: widget.folder, topic: widget.topic)),
      child: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          return BaseScreen(
            title: widget.topic.replaceAll('_', ' ').toUpperCase(),
            showSearch: _showSearch,
            onSearchToggle: () {
              setState(() {
                _showSearch = !_showSearch;
              });
            },
            searchBox: _showSearch ? const SearchBox(isSearch: true) : null,
            tabTitles: const ['Word List', 'Flashcard'],
            tabViews: [
              _buildWordListTab(context, state),
              _buildFlashcardTab(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWordListTab(BuildContext context, TopicsState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (state is TopicsLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is TopicsError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<TopicsBloc>().add(
                  GetTopic(folder: widget.folder, topic: widget.topic),
                );
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    }
    if (state is TopicsLoaded) {
      if (state.words.isEmpty) {
        return Center(
          child: Text(
            'No words found for this topic',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.words.length,
        itemBuilder: (context, index) {
          final word = state.words[index];
          return WordCard(word: word);
        },
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildFlashcardTab(BuildContext context, TopicsState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (state is TopicsLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is TopicsError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _curIndexNum = 0;
                });
                context.read<TopicsBloc>().add(
                  GetTopic(folder: widget.folder, topic: widget.topic),
                );
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    }
    if (state is TopicsLoaded) {
      if (state.words.isEmpty) {
        return Center(
          child: Text(
            'No words found for this topic',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        );
      }

      final currentWord = state.words[_curIndexNum];
      final totalWords = state.words.length;

      final definition = currentWord.senses.first.definition;
      final example = currentWord.senses.first.examples.first.x;
      if (state.words.isEmpty) {
        return Text('');
      }
      {
        final definition = currentWord.senses.first.definition;
        final example = currentWord.senses.first.examples.first.x;
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_curIndexNum + 1}/$totalWords',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: CustomFlashcards(
                front: [currentWord.word, currentWord.phoneticText],
                back: [definition.toString(), example.toString()],
                sound: currentWord.phonetic,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed:
                    _curIndexNum > 0
                        ? () {
                          setState(() {
                            _curIndexNum =
                                (_curIndexNum - 1 >= 0)
                                    ? _curIndexNum - 1
                                    : state.words.length - 1;
                          });
                        }
                        : null,
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed:
                    _curIndexNum < totalWords - 1
                        ? () {
                          setState(() {
                            _curIndexNum =
                                (_curIndexNum - 1 >= 0)
                                    ? _curIndexNum - 1
                                    : state.words.length - 1;
                          });
                        }
                        : null,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
