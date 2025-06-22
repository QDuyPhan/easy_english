import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../../../domain/entities/lesson_entity.dart';

class GrammarCategoryItem extends StatelessWidget {
  final LessonEntity lesson;

  const GrammarCategoryItem({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.push(RoutePaths.lesson, extra: {'lesson': lesson});
      },
      child: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(children: [Text(lesson.title), Text(lesson.subTitle!)]),
      ),
    );
  }
}
