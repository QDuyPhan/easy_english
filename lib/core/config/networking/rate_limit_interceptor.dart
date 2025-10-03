import 'package:dio/dio.dart';

class RateLimitInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final remainingRequests = response.headers.value('X-RateLimit-Remaining');

    if (remainingRequests != null && int.tryParse(remainingRequests) == 0) {
      print("API rate limit reached. No more requests allowed.");
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          message: 'Rate limit exceeded. Please try again later.',
        ),
      );
    }

    return handler.next(response);
  }
}
