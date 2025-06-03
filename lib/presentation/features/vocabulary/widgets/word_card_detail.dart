import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/phonetic.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/pos_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WordCardDetail extends StatelessWidget {
  final WordEntity word;

  const WordCardDetail({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final pos = word.pos.split(', ');
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.boxColor,
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
                    word.word,
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 15),
                  // SvgButton(
                  //   svg: Assets.svgStarOutline,
                  //   size: 24,
                  //   backgroundColor:
                  //       word.status == WordStatus.star
                  //           ? colorScheme.primary
                  //           : colorScheme.surface,
                  //   color:
                  //       word.status == WordStatus.star
                  //           ? colorScheme.primaryContainer
                  //           : colorScheme.onPrimaryContainer,
                  // ),
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
                  SvgPicture.asset(Assets.svgFlagUK, height: 24),
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
                  SvgPicture.asset(Assets.svgFlagUS, height: 24),
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
    );
  }
}
