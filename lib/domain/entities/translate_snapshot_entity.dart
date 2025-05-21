import 'package:easy_english/data/models/extra_translation.dart';

class TranslateSnapshotEntity {
  final String content;
  final String? spelling;
  final String? type;
  final List<ExtraTranslation> moreTranslations;

  TranslateSnapshotEntity({
    required this.content,
    required this.spelling,
    required this.type,
    required this.moreTranslations,
  });
}
