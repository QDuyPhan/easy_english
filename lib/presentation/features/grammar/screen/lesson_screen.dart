import 'package:easy_english/domain/entities/lesson_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../core/utils/widgets/svg_button.dart';

class LessonScreen extends StatefulWidget {
  final LessonEntity lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  String markdownContent = '';

  @override
  void initState() {
    super.initState();
    loadMarkdown();
  }

  Future<void> loadMarkdown() async {
    final content = await rootBundle.loadString(widget.lesson.path);
    setState(() {
      markdownContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: widget.lesson.title,
            leading: [
              SvgButton(
                svg: Assets.svgArrowLeft,
                onPressed: () => context.pop(),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:
                  markdownContent.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Markdown(data: markdownContent),
            ),
          ),
        ],
      ),
    );
  }
}
