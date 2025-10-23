import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/definition.freezed.dart';

part 'generated/definition.g.dart';

@freezed
class Definition with _$Definition {
  const factory Definition({
    @Default('') String definition,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}
