import 'package:easy_english/di/injector.dart' as di;
import 'package:easy_english/presentation/features/topics/blocs/topics_event.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_state.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../vocabulary/widgets/word_card.dart' show WordCard;
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
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider.value(
      value:
          di.getIt<TopicsBloc>()
            ..add(GetTopic(folder: widget.folder, topic: widget.topic)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: () => context.pop(),
          ),
          title: Text(
            widget.topic.replaceAll('_', ' ').toUpperCase(),
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                _showSearch ? Icons.close : Icons.search,
                color: colorScheme.primary,
              ),
              onPressed: () {
                setState(() {
                  _showSearch = !_showSearch;
                });
              },
            ),
          ],
        ),
        body: BlocBuilder<TopicsBloc, TopicsState>(
          builder: (context, state) {
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
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.error,
                      ),
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

              return Column(
                children: [
                  if (_showSearch) SearchBox(isSearch: _showSearch),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.words.length,
                      itemBuilder: (context, index) {
                        final word = state.words[index];
                        return WordCard(word: word);
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
