import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/presentation/features/topics/widgets/topic_box.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          CustomAppbar(
            title: 'Mini Dictionary',
            actions: [
              IconButton(
                onPressed: _openSearch,
                icon: Icon(
                  FluentIcons.search_12_regular,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              physics: const BouncingScrollPhysics(),
              itemCount: Assets.listTopic.length,
              itemBuilder: (context, index) {
                final entry = Assets.listTopic.entries.elementAt(index);
                return TopicBox(topicEntry: entry, index: index);
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
