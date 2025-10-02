import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pronunciation.freezed.dart';
part 'generated/pronunciation.g.dart';

@freezed
class Pronunciation with _$Pronunciation {
  const factory Pronunciation({@Default("") String? all}) = _Pronunciation;

  factory Pronunciation.fromJson(Map<String, dynamic> json) =>
      _$PronunciationFromJson(json);
}
