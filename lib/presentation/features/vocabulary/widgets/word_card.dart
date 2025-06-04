import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/data/models/word_status.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/pos_badge.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WordCard extends StatelessWidget {
  final WordEntity word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final pos = word.pos.split(', ');
    return GestureDetector(
      onTap: () {
        context.push(RoutePaths.vocabularyDetails, extra: {'word': word});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.primary40,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        word.word,
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Wrap(
                      spacing: 4,
                      children: pos.map((p) => PosBadge(word: p)).toList(),
                    ),
                  ),
                  SvgButton(
                    svg: Assets.svgStarOutline,
                    size: 16,
                    backgroundColor:
                        word.status == WordStatus.star
                            ? colorScheme.primary
                            : colorScheme.surface,
                    color:
                        word.status == WordStatus.star
                            ? colorScheme.primaryContainer
                            : colorScheme.onPrimaryContainer,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Phonetic(
                    phonetic: word.phonetic,
                    phoneticText: word.phoneticText,
                    backgroundColor: AppColor.primary60,
                    flag: 'UK',
                  ),
                  SizedBox(width: 10),
                  Phonetic(
                    phonetic: word.phoneticAm,
                    phoneticText: word.phoneticAmText,
                    backgroundColor: AppColor.primary60,
                    flag: 'US',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
