import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final List<Widget> leading;
  final List<Widget> actions;

  const CustomAppbar({
    super.key,
    required this.title,
    this.leading = const [],
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leading.isNotEmpty) ...leading else const SizedBox(width: 24),
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (actions.isNotEmpty) ...actions else const SizedBox(width: 24),
            ],
          ),
        ],
      ),
    );
  }
}
