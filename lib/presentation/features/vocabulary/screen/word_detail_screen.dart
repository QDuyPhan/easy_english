import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/entities/word_status_entity.dart';
import 'package:easy_english/presentation/features/topics/blocs/topics_bloc.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/pos_badge.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WordDetailScreen extends StatelessWidget {
  final WordEntity word;

  const WordDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final WordEntity currentWord = context.select<TopicsBloc, WordEntity>((
      bloc,
    ) {
      final state = bloc.state;
      return state.words.firstWhere(
        (w) => w.word == word.word,
        orElse: () => word,
      );
    });

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final posList = word.pos.split(', ');

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar(
              title: 'Detail Word',
              leading: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    FluentIcons.chevron_left_12_regular,
                    color: colorScheme.onBackground,
                  ),
                ),
              ],
              actions: [
                IconButton(
                  onPressed: () => _onSave(context, currentWord),
                  icon: Icon(
                    currentWord.status == WordStatusEntity.star
                        ? FluentIcons.bookmark_16_filled
                        : FluentIcons.bookmark_16_regular,
                    color:
                        currentWord.status == WordStatusEntity.star
                            ? colorScheme.secondary
                            : colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceVariant.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Word + POS
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            word.word,
                            style: textTheme.titleLarge?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Wrap(
                            spacing: 4,
                            children:
                                posList.map((p) => PosBadge(word: p)).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// Phonetic
                      _buildPhonetics(context, word),

                      const SizedBox(height: 24),
                      Text(
                        'Definition',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Definitions + Examples
                      ...List.generate(word.senses.length, (i) {
                        final sense = word.senses[i];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${i + 1}. ${sense.definition}',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (sense.examples.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text(
                                  'Examples:',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                ...List.generate(sense.examples.length, (j) {
                                  final example = sense.examples[j];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      '${j + 1}.${example.cf.isNotEmpty ? ' (${example.cf})' : ''} ${example.x}',
                                      style: textTheme.bodyMedium,
                                    ),
                                  );
                                }),
                              ],
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhonetics(BuildContext context, WordEntity word) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.svgFlagUK, height: 24),
            const SizedBox(width: 10),
            Phonetic(
              phonetic: word.phonetic,
              phoneticText: word.phoneticText,
              backgroundColor: colorScheme.primary.withOpacity(0.1),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SvgPicture.asset(Assets.svgFlagUS, height: 24),
            const SizedBox(width: 10),
            Phonetic(
              phonetic: word.phoneticAm,
              phoneticText: word.phoneticAmText,
              backgroundColor: colorScheme.primary.withOpacity(0.1),
            ),
          ],
        ),
      ],
    );
  }

  void _onSave(BuildContext context, WordEntity word) {
    final newStatus =
        word.status == WordStatusEntity.star
            ? WordStatusEntity.unknown
            : WordStatusEntity.star;

    context.read<TopicsBloc>().add(
      TopicsEvent.saveWord(word: word, wordStatus: newStatus),
    );
  }
}
