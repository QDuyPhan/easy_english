import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/data/models/word_status.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final WordEntity word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        app_config.printLog('i', '${word.pos}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
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
                      const SizedBox(width: 8),
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
                  Spacer(),
                  Text(word.pos),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('US'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgButton(
                            svg: Assets.svgVolume,
                            size: 16,
                            color: AppColor.black0,
                            backgroundColor: AppColor.primary60,
                          ),
                          SizedBox(width: 5),
                          Text(word.phoneticText),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UK'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgButton(
                            svg: Assets.svgVolume,
                            size: 16,
                            color: AppColor.black0,
                            backgroundColor: AppColor.primary60,
                          ),
                          SizedBox(width: 5),
                          Text(word.phoneticAmText),
                        ],
                      ),
                    ],
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
