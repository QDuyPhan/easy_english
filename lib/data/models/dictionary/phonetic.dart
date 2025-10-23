import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/phonetic.freezed.dart';

part 'generated/phonetic.g.dart';

@freezed
class Phonetic with _$Phonetic {
  const factory Phonetic({
    @Default('') String text,
    @Default('') String audio,
    @Default('') String sourceUrl,
  }) = _Phonetic;

  factory Phonetic.fromJson(Map<String, dynamic> json) =>
      _$PhoneticFromJson(json);
}
