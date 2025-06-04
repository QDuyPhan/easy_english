import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
import 'package:easy_english/presentation/features/topics/widgets/topic_box.dart';
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
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Mini Dictionary',
            actions: [SvgButton(svg: Assets.svgSearch, onPressed: _openSearch)],
          ),
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              crossAxisSpacing: 12,
              physics: BouncingScrollPhysics(),
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
