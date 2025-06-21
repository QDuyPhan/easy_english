import 'package:easy_english/domain/entities/lesson_entity.dart';

class CategoryDataEntity {
  final int id;
  final String title;
  final String description;
  final List<LessonEntity> lessons;
  final int progress;
  final int total;
  final bool? isBeta;

  const CategoryDataEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.lessons,
    required this.progress,
    required this.total,
    this.isBeta,
  });
}
