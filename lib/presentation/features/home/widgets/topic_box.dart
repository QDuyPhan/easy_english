import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopicBox extends StatefulWidget {
  final MapEntry<String, List<String>> topicEntry;

  const TopicBox({super.key, required this.topicEntry});

  @override
  State<TopicBox> createState() => _TopicBoxState();
}

class _TopicBoxState extends State<TopicBox> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        context.push(
          RoutePaths.topicCategory,
          extra: {'topics': widget.topicEntry},
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.8),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Image.asset(
              Assets.imageTopic,
              height: height * 0.15,
              width: width * 1,
            ),
            Text(
              widget.topicEntry.key.replaceAll('_', " ").toUpperCase(),
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
