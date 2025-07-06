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
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        final newWords =
            state.words
                .where((e) => e.status == WordStatusEntity.star)
                .toList();
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: [
                CustomAppbar(title: 'My Words'),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: newWords.length,
                    itemBuilder: (context, index) {
                      return WordCard(word: newWords[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FlashCardsButton(
            onPressed:
                () => context.push(
                  RoutePaths.flashcards,
                  extra: {'word': state.words},
                ),
          ),
        );
      },
    );
  }
}
