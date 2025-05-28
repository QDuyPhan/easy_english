import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/presentation/features/vocabulary/widgets/word_card_detail.dart';
import 'package:flutter/material.dart';

class VocabularyDetailScreen extends StatelessWidget {
  final WordEntity word;

  const VocabularyDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset(
        //     Assets.svgArrowLeft, // Đường dẫn tới file SVG
        //     width: 24, // Tùy chỉnh kích thước nếu cần
        //     height: 24,
        //   ),
        //   color: AppColor.black100,
        // ),
        title: Text("Your Note"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WordCardDetail(word: word),
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
                          ...List.generate(sense.examples.length, (index) {
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
    );
  }
}
