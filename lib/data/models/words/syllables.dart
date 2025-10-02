import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/syllables.freezed.dart';
part 'generated/syllables.g.dart';

@freezed
class Syllables with _$Syllables {
  const factory Syllables({
    @Default(0) int? count,
    @Default([]) List<String>? list,
  }) = _Syllables;

  factory Syllables.fromJson(Map<String, dynamic> json) =>
      _$SyllablesFromJson(json);
}
