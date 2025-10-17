import 'package:easy_english/data/models/lingua_robot/transcription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'audio.dart';
import 'context.dart';

part 'generated/pronunciation.freezed.dart';
part 'generated/pronunciation.g.dart';

@freezed
class Pronunciation with _$Pronunciation {
  const factory Pronunciation({
    Audio? audio,
    @Default([]) List<Transcription> transcriptions,
    Context? context,
  }) = _Pronunciation;

  factory Pronunciation.fromJson(Map<String, dynamic> json) =>
      _$PronunciationFromJson(json);
}
