import 'package:easy_english/core/mapper/dictionary/license_mapper.dart';
import 'package:easy_english/core/mapper/dictionary/meaning_mapper.dart';
import 'package:easy_english/core/mapper/dictionary/phonetic_mapper.dart';
import 'package:easy_english/domain/entities/dictionary/dictionary_entity.dart';

import '../../../data/models/dictionary/dictionary.dart';

class DictionaryMapper {
  static DictionaryEntity toDictionaryEntity(Dictionary model) {
    return DictionaryEntity(
      word: model.word,
      phonetic: model.phonetic,
      phonetics:
          model.phonetics
              ?.map((p) => PhoneticMapper.toPhoneticEntity(p))
              .toList() ??
          const [],
      meanings:
          model.meanings
              ?.map((m) => MeaningMapper.toMeaningEntity(m))
              .toList() ??
          const [],
      license:
          model.license != null
              ? LicenseMapper.toLicenseEntity(model.license!)
              : null,
      sourceUrls: model.sourceUrls ?? const [],
    );
  }

  static Dictionary toDictionaryModel(DictionaryEntity entity) {
    return Dictionary(
      word: entity.word,
      phonetic: entity.phonetic,
      phonetics:
          entity.phonetics
              ?.map((p) => PhoneticMapper.toPhoneticModel(p))
              .toList() ??
          const [],
      meanings:
          entity.meanings
              ?.map((m) => MeaningMapper.toMeaningModel(m))
              .toList() ??
          const [],
      license:
          entity.license != null
              ? LicenseMapper.toLicenseModel(entity.license!)
              : null,
      sourceUrls: entity.sourceUrls,
    );
  }
}
