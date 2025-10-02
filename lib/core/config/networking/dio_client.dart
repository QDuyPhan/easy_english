import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_english/core/config/networking/interceptors.dart';
import 'package:injectable/injectable.dart';

import 'endpoints.dart';
import 'network_connectivity.dart';

abstract class BaseDioClient {
  late final Dio _dio;
  final Connectivity _connectivity;

  BaseDioClient(this._connectivity, String baseUrl, Map<String, String> headers)
    : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: headers,
            connectTimeout: Endpoints.connectTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
          ),
        )
        ..interceptors.addAll([
          LoggerInterceptor(),
          NetworkConnectivity(connectivity: _connectivity),
        ]);

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@injectable
class WordsDio extends BaseDioClient {
  WordsDio(Connectivity connectivity)
    : super(connectivity, Endpoints.urlWordsApi, {
        "Content-Type": "application/json",
        'x-rapidapi-key': Endpoints.x_rapidapi_key,
        'x-rapidapi-host': 'wordsapiv1.p.rapidapi.com',
      });
}

@injectable
class DatamuseDio extends BaseDioClient {
  DatamuseDio(Connectivity connectivity)
    : super(connectivity, Endpoints.urlDatamuseApi, {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': '*/*',
      });
}

@injectable
class DictionaryDio extends BaseDioClient {
  DictionaryDio(Connectivity connectivity)
    : super(connectivity, Endpoints.urlDictionaryApi, {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': '*/*',
      });
}

@injectable
class HeroKuDio extends BaseDioClient {
  HeroKuDio(Connectivity connectivity)
    : super(connectivity, Endpoints.urlHeroKuApi, {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': '*/*',
      });
}
