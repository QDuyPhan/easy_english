import 'license_entity.dart';

class PhoneticEntity {
  final String? text;
  final String? audio;
  final String? sourceUrl;
  final LicenseEntity? license;

  PhoneticEntity({this.text, this.audio, this.sourceUrl, this.license});

  PhoneticEntity copyWith({
    String? text,
    String? audio,
    String? sourceUrl,
    LicenseEntity? license,
  }) {
    return PhoneticEntity(
      text: text ?? this.text,
      audio: audio ?? this.audio,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      license: license ?? this.license,
    );
  }

  factory PhoneticEntity.fromJson(Map<String, dynamic> json) {
    return PhoneticEntity(
      text: json['text'],
      audio: json['audio'],
      sourceUrl: json['sourceUrl'],
      license:
          json['license'] != null
              ? LicenseEntity.fromJson(json['license'])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text ?? '',
    'audio': audio ?? '',
    'sourceUrl': sourceUrl ?? '',
    'license': license ?? null,
  };
}
