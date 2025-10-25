import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/license.freezed.dart';
part 'generated/license.g.dart';

@freezed
class License with _$License {
  const factory License({@Default('') String? name, @Default('') String? url}) =
      _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}
