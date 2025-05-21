import 'package:easy_english/domain/entities/example_entity.dart';

class SenseEntity {
  final String definition;
  final List<ExampleEntity> examples;

  SenseEntity({
    required this.definition,
    required this.examples,
  });
}