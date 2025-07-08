import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/pos_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
class VocabularyDetailScreen extends StatelessWidget {
  final WordEntity word;

  const VocabularyDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final pos = word.pos.split(', ');

    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Vocabulary Detail',
            leading: [
              SvgButton(
                svg: Assets.svgArrowLeft,
                onPressed: () => context.pop(),
              ),
            ],
            actions: [
              SvgButton(
                svg: Assets.svgBookmarks,
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            word.word,
                            style: textTheme.headlineSmall?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 6,
                          children: pos.map((p) => PosBadge(word: p)).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// Pronunciation
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.svgFlagUK, height: 20),
                            const SizedBox(width: 8),
                            Phonetic(
                              phonetic: word.phonetic,
                              phoneticText: word.phoneticText,
                              backgroundColor: AppColor.strongBlue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.svgFlagUS, height: 20),
                            const SizedBox(width: 8),
                            Phonetic(
                              phonetic: word.phoneticAm,
                              phoneticText: word.phoneticAmText,
                              backgroundColor: AppColor.jungleGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    /// Definitions
                    Text(
                      "Definitions",
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    ...List.generate(word.senses.length, (index) {
                      final sense = word.senses[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}. ${sense.definition}',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            if (sense.examples.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                "Examples:",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.secondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              ...List.generate(sense.examples.length, (i) {
                                final ex = sense.examples[i];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    '${i + 1}. ${ex.cf.isNotEmpty ? '(${ex.cf}) ' : ''}${ex.x}',
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
    );
  }
}
