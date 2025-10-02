import 'package:freezed_annotation/freezed_annotation.dart';

class PronunciationEntity {
  final String all;

  PronunciationEntity({required this.all});
  PronunciationEntity copyWith({String? all}) {
    return PronunciationEntity(all: all ?? this.all);
  }

  factory PronunciationEntity.fromJson(Map<String, dynamic> json) {
    return PronunciationEntity(all: json['all'] ?? "");
  }
}
