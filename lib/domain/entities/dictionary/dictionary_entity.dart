import 'license_entity.dart';
import 'meaning_entity.dart';
import 'phonetic_entity.dart';

class DictionaryEntity {
  final String? word;
  final String? phonetic;
  final List<PhoneticEntity>? phonetics;
  final List<MeaningEntity>? meanings;
  final LicenseEntity? license;
  final List<String>? sourceUrls;

  DictionaryEntity({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  DictionaryEntity copyWith({
    String? word,
    String? phonetic,
    List<PhoneticEntity>? phonetics,
    List<MeaningEntity>? meanings,
    LicenseEntity? license,
    List<String>? sourceUrls,
  }) => DictionaryEntity(
    word: word ?? this.word,
    phonetic: phonetic ?? this.phonetic,
    phonetics: phonetics ?? this.phonetics,
    meanings: meanings ?? this.meanings,
    license: license ?? this.license,
    sourceUrls: sourceUrls ?? this.sourceUrls,
  );

  factory DictionaryEntity.fromJson(Map<String, dynamic> json) =>
      DictionaryEntity(
        word: json["word"] ?? '',
        phonetic: json["phonetic"] ?? '',
        phonetics:
            json["phonetics"] == null
                ? []
                : List<PhoneticEntity>.from(
                  json["phonetics"].map((x) => PhoneticEntity.fromJson(x)),
                ),
        meanings:
            json["meanings"] == null
                ? []
                : List<MeaningEntity>.from(
                  json["meanings"].map((x) => MeaningEntity.fromJson(x)),
                ),
        license:
            json["license"] == null
                ? null
                : LicenseEntity.fromJson(json["license"]),
        sourceUrls:
            json["sourceUrls"] == null
                ? []
                : List<String>.from(json["sourceUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    'word': word ?? '',
    'phonetic': phonetic ?? '',
    'phonetics': phonetics ?? [],
    'meanings': meanings ?? [],
    'license': license ?? null,
    'sourceUrls': sourceUrls ?? [],
  };
}
