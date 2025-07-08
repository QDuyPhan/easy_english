import 'package:easy_english/domain/entities/word_status_entity.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../flashcard/widgets/flash_cards_button.dart';
import '../../vocabulary/widgets/word_card.dart';

class StudyingScreen extends StatelessWidget {
  const StudyingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        final newWords = state.words
            .where((e) => e.status == WordStatusEntity.star)
            .toList();

        return Scaffold(
          backgroundColor: colorScheme.background,
          body: SafeArea(
            child: Column(
              children: [
                const CustomAppbar(title: 'My Words'),
                const SizedBox(height: 8),
                if (newWords.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'No saved words yet',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: newWords.length,
                      itemBuilder: (context, index) {
                        return WordCard(word: newWords[index]);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                    ),
                  ),
              ],
            ),
          ),
          floatingActionButton: newWords.isEmpty
              ? null
              : FlashCardsButton(
            onPressed: () {
              context.push(
                RoutePaths.flashcards,
                extra: {'word': newWords},
              );
            },
          ),
        );
      },
    );
  }
}
