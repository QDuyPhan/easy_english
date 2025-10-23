import '../../../data/models/dictionary/license.dart';
import '../../../domain/entities/dictionary/license_entity.dart';

class LicenseMapper {
  static LicenseEntity toLicenseEntity(License model) {
    return LicenseEntity(
      name: model.name,
      url: model.url,
    );
  }

  static License toLicenseModel(LicenseEntity entity) {
    return License(
      name: entity.name,
      url: entity.url,
    );
  }
}