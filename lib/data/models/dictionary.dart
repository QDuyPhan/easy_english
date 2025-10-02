import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/dictionary.freezed.dart';

@freezed
class Dictionary with _$Dictionary {
  const factory Dictionary({
    required String topic,
    required List<String> category,
    required String image,
  }) = _Dictionary;
}
