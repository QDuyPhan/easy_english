import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/navigation/route_paths.dart';

class TopicBox extends StatefulWidget {
  final MapEntry<String, List<String>> topicEntry;
  final int index;

  const TopicBox({super.key, required this.topicEntry, required this.index});

  @override
  State<TopicBox> createState() => _TopicBoxState();
}

class _TopicBoxState extends State<TopicBox> {
  static final Random random = Random();
  static final List<Color> availableColors =
      AppColor.listColor; // Danh sách màu ban đầu
  static final List<Color> usedColors = []; // Theo dõi màu đã sử dụng
  late Color _color;

  @override
  void initState() {
    super.initState();
    _assignUniqueColor();
  }

  void _assignUniqueColor() {
    if (usedColors.length >= availableColors.length) {
      // Nếu đã dùng hết màu, làm mới danh sách
      usedColors.clear();
    }
    // Lấy màu ngẫu nhiên từ danh sách còn lại
    final available =
        availableColors.where((color) => !usedColors.contains(color)).toList();
    if (available.isNotEmpty) {
      _color = available[random.nextInt(available.length)];
      usedColors.add(_color);
    } else {
      // Nếu không còn màu nào, chọn ngẫu nhiên từ toàn bộ danh sách
      _color = availableColors[random.nextInt(availableColors.length)];
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final image = app_config.listImageTopic[widget.index];

    return GestureDetector(
      onTap: () {
        context.push(
          RoutePaths.topicCategory,
          extra: {'topics': widget.topicEntry},
        );
      },
      child: Card(
        elevation: 4,
        color: _color, // Sử dụng màu đã gán duy nhất
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  height: height * 0.15,
                  width: width * 0.15,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                widget.topicEntry.key.replaceAll('_', " ").toUpperCase(),
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
