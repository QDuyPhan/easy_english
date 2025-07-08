import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/entities/word_status_entity.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/pos_badge.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WordCard extends StatelessWidget {
  final WordEntity word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final pos = word.pos.split(', ');

    return InkWell(
      onTap: () {
        context.push(RoutePaths.wordDetails, extra: {'word': word});
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Word title + bookmark icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Word + POS badges
                Expanded(
                  child: Row(
                    children: [
                      /// Word
                      Flexible(
                        flex: 3,
                        child: Text(
                          word.word,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      /// POS badges
                      Flexible(
                        flex: 2,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 4,
                            children:
                                pos.map((p) => PosBadge(word: p)).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Bookmark icon
                Tooltip(
                  message:
                      word.status == WordStatusEntity.star
                          ? 'Unsave word'
                          : 'Save word',
                  child: IconButton(
                    onPressed: () => _onSave(context),
                    icon: Icon(
                      word.status == WordStatusEntity.star
                          ? FluentIcons.bookmark_16_filled
                          : FluentIcons.bookmark_16_regular,
                      color:
                          word.status == WordStatusEntity.star
                              ? colorScheme.secondary
                              : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Phonetics
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Phonetic(
                  phonetic: word.phonetic,
                  phoneticText: word.phoneticText,
                  backgroundColor: colorScheme.primaryContainer,
                ),
                const SizedBox(height: 4),
                Phonetic(
                  phonetic: word.phoneticAm,
                  phoneticText: word.phoneticAmText,
                  backgroundColor: colorScheme.tertiaryContainer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSave(BuildContext context) {
    final newStatus =
        word.status == WordStatusEntity.star
            ? WordStatusEntity.unknown
            : WordStatusEntity.star;

    context.read<TopicsBloc>().add(
      TopicsEvent.saveWord(word: word, wordStatus: newStatus),
    );
  }
}
