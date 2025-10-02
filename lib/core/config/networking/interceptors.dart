import 'package:dio/dio.dart';
import 'package:easy_english/core/config/app_config.dart';

import 'endpoints.dart';

class LoggerInterceptor extends Interceptor {
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    app_config.printLog('e', '${options.method} request ==> $requestPath');
    app_config.printLog(
      'd',
      'Error type: ${err.error} \n '
          'Error message: ${err.message}',
    );
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requestPath = '${options.baseUrl}${options.path}';
    app_config.printLog('i', '${options.method} request ==> $requestPath');
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    app_config.printLog(
      'd',
      'STATUSCODE: ${response.statusCode} \n '
          'STATUSMESSAGE: ${response.statusMessage} \n'
          'HEADERS: ${response.headers} \n'
          'URL: ${response.requestOptions.uri} \n'
          'Data: ${response.data}',
    );
    return handler.next(response);
  }
}

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_needAuthorizationHeader(options)) {
      options.headers['Authorization'] = Endpoints.api_token;
    }
    handler.next(options);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return true;
    }
    return false;
  }
}
