import 'package:easy_english/domain/entities/lesson_entity.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          CustomAppbar(
            title: widget.lesson.title,
            leading: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  FluentIcons.chevron_left_12_regular,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:
                  markdownContent.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Markdown(
                        data: markdownContent,
                        styleSheet: MarkdownStyleSheet.fromTheme(
                          Theme.of(context),
                        ).copyWith(
                          p: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onBackground,
                            height: 1.5,
                          ),
                          h1: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                          h2: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                          h3: textTheme.titleMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                          strong: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        selectable: true,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
