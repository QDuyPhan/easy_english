import 'package:easy_english/core/utils/word_pos.dart';
import 'package:flutter/material.dart';

class PosBadge extends StatelessWidget {
  final String word;

  const PosBadge({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final pos = WordPos.fromString(word);
    final backgroundColor = pos.color;
    final textColor = ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        word,
        style: textTheme.labelSmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
