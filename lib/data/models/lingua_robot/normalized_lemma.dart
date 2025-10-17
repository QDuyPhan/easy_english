import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/normalized_lemma.freezed.dart';
part 'generated/normalized_lemma.g.dart';

@freezed
class NormalizedLemma with _$NormalizedLemma {
  const factory NormalizedLemma({@Default('') String lemma}) = _NormalizedLemma;

  factory NormalizedLemma.fromJson(Map<String, dynamic> json) =>
      _$NormalizedLemmaFromJson(json);
}
