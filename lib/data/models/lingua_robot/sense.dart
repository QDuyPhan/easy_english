import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/sense.freezed.dart';
part 'generated/sense.g.dart';

@freezed
class Sense with _$Sense {
  const factory Sense({
    @Default('') String definition,
    @Default([]) List<String> labels,
  }) = _Sense;

  factory Sense.fromJson(Map<String, dynamic> json) => _$SenseFromJson(json);
}
