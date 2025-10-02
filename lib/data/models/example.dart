import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/example.freezed.dart';
part 'generated/example.g.dart';

// @freezed
// @HiveType(typeId: HiveTypes.example)
// class Example with _$Example {
//   const factory Example({
//     @HiveField(0) @Default("") String cf,
//     @HiveField(1) @Default("") String x,
//   }) = _Example;
//
//   factory Example.fromJson(Map<String, dynamic> json) =>
//       _$ExampleFromJson(json);
// }

@freezed
class Example with _$Example {
  const factory Example({@Default("") String cf, @Default("") String x}) =
      _Example;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}
