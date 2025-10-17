import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/audio.freezed.dart';
part 'generated/audio.g.dart';

@freezed
class Audio with _$Audio {
  const factory Audio({
    @Default('') String url,
    // @Default(null) License license,
    @Default('') String sourceUrl,
  }) = _Audio;

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
}
