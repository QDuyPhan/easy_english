import '../../../data/models/dictionary/phonetic.dart';
import '../../../domain/entities/dictionary/phonetic_entity.dart';
import 'license_mapper.dart';

class PhoneticMapper {
  static PhoneticEntity toPhoneticEntity(Phonetic model) {
    return PhoneticEntity(
      text: model.text,
      audio: model.audio,
      sourceUrl: model.sourceUrl,
      license:
          model.license != null
              ? LicenseMapper.toLicenseEntity(model.license!)
              : null,
    );
  }

  static Phonetic toPhoneticModel(PhoneticEntity entity) {
    return Phonetic(
      text: entity.text,
      audio: entity.audio,
      sourceUrl: entity.sourceUrl,
      license:
          entity.license != null
              ? LicenseMapper.toLicenseModel(entity.license!)
              : null,
    );
  }
}
