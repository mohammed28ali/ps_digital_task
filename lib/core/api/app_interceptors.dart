import 'dart:developer';

import 'package:dio/dio.dart';
import '../utils/app_strings.dart';

class AppInterceptors extends Interceptor {
  final bool enableLogging;

  AppInterceptors({this.enableLogging = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      log('REQUEST[${options.method}] => PATH: ${options.path}');
      log('REQUEST HEADERS: ${options.headers}');
      log('REQUEST QUERY PARAMS: ${options.queryParameters}');
      if (options.data != null) {
        log('REQUEST BODY: ${options.data}');
      }
    }

    options.headers[AppStrings.contentType] =
        options.headers[AppStrings.contentType] ?? AppStrings.applicationJson;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enableLogging) {
      log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
      log('RESPONSE DATA: ${response.data}');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enableLogging) {
      log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
      log('ERROR MESSAGE: ${err.message}');
      if (err.response?.data != null) {
        log('ERROR RESPONSE: ${err.response?.data}');
      }
    }

    super.onError(err, handler);
  }
}
