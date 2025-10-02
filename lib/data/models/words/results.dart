import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/results.freezed.dart';
part 'generated/results.g.dart';

@freezed
class Results with _$Results {
  const factory Results({
    @Default("") String? definition,
    @Default("") String? partOfSpeech,
    @Default([]) List<String>? synonyms,
    @Default([]) List<String>? typeOf,
    @Default([]) List<String>? hasTypes,
    @Default([]) List<String>? derivation,
    @Default([]) List<String>? examples,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
