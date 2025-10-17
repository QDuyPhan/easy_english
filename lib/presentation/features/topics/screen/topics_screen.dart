import 'package:easy_english/presentation/features/vocabulary/widgets/word_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/navigation/app_route_paths.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
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
    app_config.printLog(
      'i',
      'TopicsScreen: initState: ${widget.folder}/${widget.topic}',
    );
    // context.read<TopicsBloc>().add(
    //   TopicsEvent.getAllTopics(folder: widget.folder, topic: widget.topic),
    // );
    context.read<TopicsBloc>().add(
      TopicsEvent.getTopicFromJson(folder: widget.folder, topic: widget.topic),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbar(
            text: Text(widget.topic.replaceAll('_', ' ').toUpperCase()),
            centerTitle: true,
            leading: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(FluentIcons.chevron_left_12_regular),
              ),
            ],
          ),
          backgroundColor: colorScheme.background,
          body: _buildWordListTab(context, state),
          floatingActionButton: FlashCardsButton(
            onPressed: () {
              context.push(
                AppRoutePaths.flashcards,
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
