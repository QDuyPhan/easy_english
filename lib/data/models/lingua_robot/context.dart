import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/context.freezed.dart';
part 'generated/context.g.dart';

@freezed
class Context with _$Context {
  const factory Context({@Default([]) List<String> regions}) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
}
