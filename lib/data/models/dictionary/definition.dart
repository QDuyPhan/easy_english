import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/definition.freezed.dart';

part 'generated/definition.g.dart';

@freezed
class Definition with _$Definition {
  const factory Definition({
    String? definition,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
    String? example,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}
