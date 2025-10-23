class PhoneticEntity {
  final String? text;
  final String? audio;
  final String? sourceUrl;

  PhoneticEntity({this.text, this.audio, this.sourceUrl});

  PhoneticEntity copyWith({
    String? text,
    String? audio,
    String? sourceUrl,
  }) {
    return PhoneticEntity(
      text: text ?? this.text,
      audio: audio ?? this.audio,
      sourceUrl: sourceUrl ?? this.sourceUrl,
    );
  }


  factory PhoneticEntity.fromJson(Map<String, dynamic> json) {
    return PhoneticEntity(
      text: json['text'] ?? '',
      audio: json['audio'] ?? '',
      sourceUrl: json['sourceUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text ?? '',
    'audio': audio ?? '',
    'sourceUrl': sourceUrl ?? '',
  };
}
