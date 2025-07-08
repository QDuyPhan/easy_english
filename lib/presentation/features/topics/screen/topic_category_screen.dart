import 'dart:math';

import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/theme/app_color.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopicCategoryScreen extends StatefulWidget {
  final MapEntry<String, List<String>> topicEntry;

  const TopicCategoryScreen({super.key, required this.topicEntry});

  @override
  State<TopicCategoryScreen> createState() => _TopicCategoryScreenState();
}

class _TopicCategoryScreenState extends State<TopicCategoryScreen> {
  static final Random random = Random();
  static final List<Color> availableColors = AppColor.listColor;
  static final List<Color> usedColors = [];
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _assignUniqueColors();
  }

  void _assignUniqueColors() {
    if (usedColors.length >= availableColors.length) {
      usedColors.clear();
    }
    _colors = List.generate(widget.topicEntry.value.length, (index) {
      final available =
      availableColors.where((color) => !usedColors.contains(color)).toList();
      if (available.isNotEmpty) {
        final color = available[random.nextInt(available.length)];
        usedColors.add(color);
        return color;
      } else {
        return availableColors[random.nextInt(availableColors.length)];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          CustomAppbar(
            title: widget.topicEntry.key.toUpperCase().replaceAll('_', ' '),
            leading: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  FluentIcons.chevron_left_12_regular,
                  color: colorScheme.onBackground,
                ),
              ),
            ],
            actions: [
              IconButton(
                onPressed: _openSearch,
                icon: Icon(
                  FluentIcons.search_12_regular,
                  color: colorScheme.onBackground,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.topicEntry.value.length,
              itemBuilder: (context, index) {
                final color = _colors[index];
                final category = widget.topicEntry.value[index];
                return InkWell(
                  onTap: () {
                    context.push(
                      RoutePaths.topics,
                      extra: {
                        'folder': widget.topicEntry.key,
                        'topic': category,
                      },
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.shadow.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            category.replaceAll('_', ' ').toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Icon(
                          FluentIcons.chevron_right_12_regular,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openSearch() {
    context.push(RoutePaths.search);
  }
}
