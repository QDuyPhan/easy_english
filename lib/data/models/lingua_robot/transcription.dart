import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/transcription.freezed.dart';
part 'generated/transcription.g.dart';

@freezed
class Transcription with _$Transcription {
  const factory Transcription({
    @Default('') String transcription,
    @Default('') String notation,
  }) = _Transcription;

  factory Transcription.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionFromJson(json);
}
