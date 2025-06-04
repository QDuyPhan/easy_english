import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/presentation/features/home/widgets/topic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          // Container(
          //   height: height * 0.2,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [AppColor.primary40, AppColor.primary60],
          //       stops: [0.0, 0.7],
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //     ),
          //   ),
          // ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Chose your topic',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
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
                      return TopicBox(topicEntry: entry);
                    },
                  ),
                ),
              ],
            ),
          ),
          // FloatingActionButton(onPressed: () {
          //   context.push(RoutePaths.vocabulary);
          // }),
        ],
      ),
    );
  }
}
