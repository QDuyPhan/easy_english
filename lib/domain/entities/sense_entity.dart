import 'package:easy_english/domain/entities/example_entity.dart';

class SenseEntity {
  final String definition;
  final List<ExampleEntity> examples;

  SenseEntity({required this.definition, required this.examples});

  SenseEntity copyWith({String? definition, List<ExampleEntity>? examples}) {
    return SenseEntity(
      definition: definition ?? this.definition,
      examples: examples ?? this.examples,
    );
  }
}
