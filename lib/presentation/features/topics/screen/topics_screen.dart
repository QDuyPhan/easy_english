import 'package:easy_english/core/utils/widgets/base_screen.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/search_box.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../flashcard/widgets/flash_cards_button.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<TopicsBloc>().add(
      TopicsEvent.getAllTopics(folder: widget.folder, topic: widget.topic),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.background,
          body: BaseScreen(
            title: widget.topic.replaceAll('_', ' ').toUpperCase(),
            showSearch: _showSearch,
            onSearchToggle: () {
              setState(() {
                _showSearch = !_showSearch;
              });
            },
            searchBox: _showSearch ? SearchBox(showSearch: _showSearch) : null,
            tabViews: [_buildWordListTab(context, state)],
          ),
          floatingActionButton: FlashCardsButton(
            onPressed: () {
              context.push(
                RoutePaths.flashcards,
                extra: {'word': state.words},
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildWordListTab(BuildContext context, TopicsState state) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (state.words.isEmpty) {
      return Center(
        child: Text(
          'No words available',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: state.words.length,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemBuilder: (context, index) {
        final word = state.words[index];
        return WordCard(word: word);
      },
    );
  }
}
