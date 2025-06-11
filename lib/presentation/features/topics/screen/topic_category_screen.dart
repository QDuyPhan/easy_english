import 'dart:math';

import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:easy_english/core/utils/assets.dart';
import 'package:easy_english/core/utils/widgets/custom_appbar.dart';
import 'package:easy_english/core/utils/widgets/svg_button.dart';
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
  static final List<Color> availableColors =
      AppColor.listColor; // Danh sách màu ban đầu
  static final List<Color> usedColors = []; // Theo dõi màu đã sử dụng
  late List<Color> _colors; // Danh sách màu cho các mục

  @override
  void initState() {
    super.initState();
    _assignUniqueColors();
  }

  void _assignUniqueColors() {
    if (usedColors.length >= availableColors.length) {
      // Làm mới danh sách màu nếu đã dùng hết
      usedColors.clear();
    }
    // Gán màu duy nhất cho từng mục
    _colors = List.generate(widget.topicEntry.value.length, (index) {
      final available =
          availableColors
              .where((color) => !usedColors.contains(color))
              .toList();
      if (available.isNotEmpty) {
        final color = available[random.nextInt(available.length)];
        usedColors.add(color);
        return color;
      } else {
        // Nếu không còn màu, chọn ngẫu nhiên từ toàn bộ danh sách
        return availableColors[random.nextInt(availableColors.length)];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: widget.topicEntry.key.toUpperCase(),
            leading: [
              SvgButton(
                svg: Assets.svgArrowLeft,
                onPressed: () {
                  context.pop();
                },
              ),
            ],
            actions: [SvgButton(svg: Assets.svgSearch, onPressed: _openSearch)],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.topicEntry.value.length,
              itemBuilder: (context, index) {
                final color = _colors[index]; // Sử dụng màu đã gán
                final category = widget.topicEntry.value[index];
                return Card(
                  color: color,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                        extra: {
                          'folder': widget.topicEntry.key,
                          'topic': category,
                        },
                      );
                    },
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
