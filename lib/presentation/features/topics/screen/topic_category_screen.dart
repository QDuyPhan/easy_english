import 'package:easy_english/core/config/app_config.dart';
import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopicCategoryScreen extends StatelessWidget {
  final MapEntry<String, List<String>> topicEntry;

  const TopicCategoryScreen({super.key, required this.topicEntry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          topicEntry.key.replaceAll('_', ' ').toUpperCase(),
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topicEntry.value.length,
        itemBuilder: (context, index) {
          final category = topicEntry.value[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                category.replaceAll('_', ' ').toUpperCase(),
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                context.push(
                  RoutePaths.topics,
                  extra: {'folder': topicEntry.key, 'topic': category},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
