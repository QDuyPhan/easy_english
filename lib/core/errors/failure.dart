import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({
    @Default('Server error occurred') String message,
    int? statusCode,
  }) = ServerFailure;

  const factory Failure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  const factory Failure.notFound({@Default('Data not found') String message}) =
      NotFoundFailure;

  const factory Failure.general({
    @Default('An unexpected error occurred') String message,
  }) = GeneralFailure;
}
