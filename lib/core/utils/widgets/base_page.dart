import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets padding;
  final List<Widget> actions;

  const BasePage({
    super.key,
    required this.child,
    required this.title,
    this.actions = const [],
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Column(
        children: [
          CustomAppbar(title: title, actions: actions),
          Expanded(child: Padding(padding: padding, child: child)),
        ],
      ),
    );
  }
}
