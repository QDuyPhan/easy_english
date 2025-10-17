import 'package:freezed_annotation/freezed_annotation.dart';

import 'grammar.dart';

part 'generated/form.freezed.dart';
part 'generated/form.g.dart';

@freezed
class Form with _$Form {
  const factory Form({
    @Default('') String form,
    @Default([]) List<Grammar> grammar,
  }) = _Form;

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
}
