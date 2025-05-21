import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/failure.freezed.dart';

@freezed
class Failure with _$Failure {
  // Lỗi máy chủ (server error)
  const factory Failure.server({
    @Default('Server error occurred') String message,
    int? statusCode,
  }) = ServerFailure;

  // Lỗi mạng (network error)
  const factory Failure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  // Lỗi dữ liệu không tìm thấy (not found)
  const factory Failure.notFound({
    @Default('Data not found') String message,
  }) = NotFoundFailure;

  // Lỗi chung (general error)
  const factory Failure.general({
    @Default('An unexpected error occurred') String message,
  }) = GeneralFailure;
}