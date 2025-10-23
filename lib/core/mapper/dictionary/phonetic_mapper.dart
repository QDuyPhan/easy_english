import '../../../data/models/dictionary/phonetic.dart';
import '../../../domain/entities/dictionary/phonetic_entity.dart';

class PhoneticMapper {
  static PhoneticEntity toPhoneticEntity(Phonetic model) {
    return PhoneticEntity(
      text: model.text,
      audio: model.audio,
      sourceUrl: model.sourceUrl,
    );
  }

  static Phonetic toPhoneticModel(PhoneticEntity entity) {
    return Phonetic(
      text: entity.text,
      audio: entity.audio,
      sourceUrl: entity.sourceUrl,
    );
  }
}
