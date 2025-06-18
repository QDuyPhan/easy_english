import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/flashcard/widgets/flash_cards_button.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/pos_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WordDetailScreen extends StatelessWidget {
  final WordEntity word;

  const WordDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final pos = word.pos.split(', ');
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Detail Vocabulary',
            leading: [
              SvgButton(
                svg: Assets.svgArrowLeft,
                onPressed: () {
                  context.pop();
                },
              ),
            ],
            actions: [SvgButton(svg: Assets.svgBookmarks, onPressed: () {})],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.boxColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    word.word,
                                    style: textTheme.titleLarge?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ),
                              Spacer(),
                              ...List.generate(
                                pos.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: PosBadge(word: pos[index]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgFlagUK,
                                    height: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Phonetic(
                                    phonetic: word.phonetic,
                                    phoneticText: word.phoneticText,
                                    backgroundColor: AppColor.primary60,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgFlagUS,
                                    height: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Phonetic(
                                    phonetic: word.phoneticAm,
                                    phoneticText: word.phoneticAmText,
                                    backgroundColor: AppColor.primary60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Definition",
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...List.generate(word.senses.length, (index) {
                        final sense = word.senses[index];
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}. ${sense.definition}',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              if (sense.examples.isNotEmpty) ...[
                                Text("Examples:"),
                                const SizedBox(height: 8),
                                ...List.generate(sense.examples.length, (
                                  index,
                                ) {
                                  final example = sense.examples[index];
                                  return Text(
                                    '${index + 1}.${example.cf.isNotEmpty ? ' (${example.cf})' : ''} ${example.x}',
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontSize: 16,
                                    ),
                                  );
                                }),
                                const SizedBox(height: 8),
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
          ),
        ],
      ),
    );
  }
}
