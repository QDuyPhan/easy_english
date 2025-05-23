import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:easy_english/data/models/example.dart';
import 'package:easy_english/data/models/sense.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:easy_english/data/models/word_status.dart';
import 'package:easy_english/domain/entities/example_entity.dart';
import 'package:easy_english/domain/entities/sense_entity.dart';
import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/entities/word_status_entity.dart';

import 'app_mappr.auto_mappr.dart';import 'package:injectable/injectable.dart';

@AutoMappr([
  MapType<Word, WordEntity>(),
  MapType<WordEntity, Word>(),
  MapType<Sense, SenseEntity>(),
  MapType<SenseEntity, Sense>(),
  MapType<Example, ExampleEntity>(),
  MapType<ExampleEntity, Example>(),
  MapType<WordStatus, WordStatusEntity>(
    fields: [
      Field.custom('unknown', custom: WordStatusEntity.unknown),
      Field.custom('mastered', custom: WordStatusEntity.mastered),
      Field.custom('star', custom: WordStatusEntity.star),
    ],
  ),
  MapType<WordStatusEntity, WordStatus>(
    fields: [
      Field.custom('unknown', custom: WordStatus.unknown),
      Field.custom('mastered', custom: WordStatus.mastered),
      Field.custom('star', custom: WordStatus.star),
    ],
  ),
])
@injectable
class AppMappr extends $AppMappr {}