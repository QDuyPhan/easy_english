import 'package:easy_english/core/utils/word_pos.dart';
import 'package:flutter/material.dart';

class PosBadge extends StatelessWidget {
  final String word;

  const PosBadge({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: WordPos.fromString(word).color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        word,
        style: textTheme.titleSmall?.copyWith(color: Colors.white),
      ),
    );
  }
}
