import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/base_screen.dart';
import 'package:easy_english/core/utils/widgets/custom_flashcards.dart';
import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/topics/blocs/topics_event.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_state.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/search_box.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:flip_card/flip_card.dart';
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
    if (state is TopicsLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is TopicsError) {
      return Center(
        child: Text(
          state.message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    if (state is TopicsLoaded) {
      if (state.words.isEmpty) {
        return Center(
          child: Text(
            'No words found for this topic',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        );
      }

      final currentWord = state.words[_curIndexNum];

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: CustomFlashcards(text: currentWord.word.toUpperCase()),
              back: CustomFlashcards(
                text: currentWord.phoneticText,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${_curIndexNum + 1}/${state.words.length}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: state.words.length > 1 ? showPreviousCard : null,
                icon: const Icon(
                  Icons.arrow_left,
                  size: 30,
                  color: Color(0xFFE4E4E4),
                ),
                label: const Text(""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 25,
                    top: 15,
                    bottom: 15,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: state.words.length > 1 ? showNextCard : null,
                icon: const Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Color(0xFFE4E4E4),
                ),
                label: const Text(""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 25,
                    top: 15,
                    bottom: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  void showNextCard() {
    setState(() {
      if (context.read<TopicsBloc>().state is TopicsLoaded) {
        final state = context.read<TopicsBloc>().state as TopicsLoaded;
        _curIndexNum =
            (_curIndexNum + 1 < state.words.length) ? _curIndexNum + 1 : 0;
      }
    });
  }

  void showPreviousCard() {
    setState(() {
      if (context.read<TopicsBloc>().state is TopicsLoaded) {
        final state = context.read<TopicsBloc>().state as TopicsLoaded;
        _curIndexNum =
            (_curIndexNum - 1 >= 0) ? _curIndexNum - 1 : state.words.length - 1;
      }
    });
  }
}
