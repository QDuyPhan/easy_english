import 'package:easy_english/data/models/words/syllables.dart';

class SyllablesMapper {
  static Syllables toEntity(Syllables entity) {
    return Syllables(count: entity.count, list: entity.list);
  }

  static Syllables toModel(Syllables syllables) {
    return Syllables(count: syllables.count!, list: syllables.list!);
  }
}
