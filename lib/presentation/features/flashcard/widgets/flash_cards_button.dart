import 'package:easy_english/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FlashCardsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FlashCardsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Material(
      color: colorScheme.primary,
      borderRadius: BorderRadius.circular(1000),
      child: InkWell(
        borderRadius: BorderRadius.circular(1000),
        onTap: onPressed,
        child: CircularPercentIndicator(
          radius: 24.0,
          lineWidth: 4.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Image.asset(
            Assets.pngFlashCards,
            height: currentHeight * 0.09,
            width: currentWidth * 0.09,
          ),
        ),
      ),
    );
  }
}
