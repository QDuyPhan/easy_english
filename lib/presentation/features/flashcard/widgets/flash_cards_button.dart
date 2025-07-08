import 'package:easy_english/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FlashCardsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FlashCardsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final iconSize = size.width * 0.09;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(1000),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            Assets.pngFlashCards,
            height: iconSize,
            width: iconSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
