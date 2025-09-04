import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:ps_digital_task/core/api/status_code.dart';
import 'package:ps_digital_task/core/errors/exceptions.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  final bool enableLogging;
  final Duration connectionTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;

  DioConsumer({
    required this.client,
    this.enableLogging = kDebugMode,
    this.connectionTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 10),
    this.sendTimeout = const Duration(seconds: 10),
  }) {
    _configureClient();
  }

  void _configureClient() {
    // Configure certificate validation
    if (client.httpClientAdapter is IOHttpClientAdapter) {
      (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
            client.badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
            return client;
          };
    }

    // Configure client options
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..connectTimeout = connectionTimeout
      ..receiveTimeout = receiveTimeout
      ..sendTimeout = sendTimeout
      ..validateStatus = (status) {
        return status != null && status < StatusCode.internalServerError;
      };

    // Add interceptors
    //client.interceptors.add(AppInterceptors(enableLogging: enableLogging));
    client.interceptors.add(
      AwesomeDioInterceptor(
        logRequestTimeout: true,
        logRequestHeaders: true,
        logResponseHeaders: true,
      ),
    );

    // Add logging interceptor in debug mode
    // if (enableLogging) {
    //   client.interceptors.add(
    //     LogInterceptor(
    //       requestBody: true,
    //       responseBody: true,
    //       logPrint: (object) => log(object.toString()),
    //     ),
    //   );
    // }
  }

  @override
  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.get(
        '${EndPoints.baseUrl}$endPoint',
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    } catch (error) {
      throw UnexpectedException(error.toString());
    }
  }

  @override
  Future<dynamic> post(
    String endPoint, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.post(
        '${EndPoints.baseUrl}$endPoint',
        queryParameters: queryParameters,
        data: formDataIsEnabled && body != null ? FormData.fromMap(body) : body,
        options: Options(headers: headers),
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    } catch (error) {
      throw UnexpectedException(error.toString());
    }
  }

  @override
  Future<dynamic> put(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.put(
        '${EndPoints.baseUrl}$endPoint',
        queryParameters: queryParameters,
        data: body,
        options: Options(headers: headers),
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    } catch (error) {
      throw UnexpectedException(error.toString());
    }
  }

  @override
  Future<dynamic> delete(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.delete(
        '${EndPoints.baseUrl}$endPoint',
        queryParameters: queryParameters,
        data: body,
        options: Options(headers: headers),
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    } catch (error) {
      throw UnexpectedException(error.toString());
    }
  }

  @override
  Future<dynamic> patch(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.patch(
        '${EndPoints.baseUrl}$endPoint',
        queryParameters: queryParameters,
        data: body,
        options: Options(headers: headers),
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    } catch (error) {
      throw UnexpectedException(error.toString());
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    try {
      if (response.data == null || response.data.toString().isEmpty) {
        return null;
      }

      final responseJson = jsonDecode(response.data.toString());

      if (responseJson is Map) {
        final errorMessage = responseJson['errorMessage'];
        if (errorMessage != null && errorMessage.toString().isNotEmpty) {
          log('error message from dio consumer: $errorMessage');
          MessageHandler.show(message: errorMessage.toString(), error: true);
          throw ServerException(errorMessage.toString());
        }

        if (responseJson['data'] is Map &&
            responseJson['data']?.containsKey('message') == true) {
          final message = responseJson['data']?['message'];
          if (message != null && message.toString().isNotEmpty) {
            log('success message from dio consumer: $message');
            MessageHandler.show(message: message.toString());
          }
        }
      }

      return responseJson;
    } catch (e) {
      throw const JsonDecodingException();
    }
  }

  Exception _handleDioError(DioException error) {
    final errorMsg = _getErrorMessage(error);
    log('error dio consumer => $errorMsg');
    MessageHandler.show(
      message: error.type == DioExceptionType.connectionError
          ? 'No internet connection'
          : errorMsg,
      error: true,
    );

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ConnectionTimeoutException();
      case DioExceptionType.sendTimeout:
        return const SendTimeoutException();
      case DioExceptionType.receiveTimeout:
        return const ReceiveTimeoutException();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case StatusCode.badRequest:
            return BadRequestException(_getErrorMessage(error));
          case StatusCode.unauthorized:
            return UnauthorizedException(_getErrorMessage(error));
          case StatusCode.forbidden:
            return ForbiddenException(_getErrorMessage(error));
          case StatusCode.notFound:
            return NotFoundException(_getErrorMessage(error));
          case StatusCode.conflict:
            return ConflictException(_getErrorMessage(error));
          case StatusCode.internalServerError:
            return InternalServerErrorException(_getErrorMessage(error));
          case StatusCode.unprocessableEntity:
            return UnprocessableEntityException(_getErrorMessage(error));
          default:
            return ServerException(_getErrorMessage(error));
        }
      case DioExceptionType.cancel:
        return const RequestCancelledException();
      case DioExceptionType.badCertificate:
        return const BadCertificateException();
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NoInternetConnectionException();
        }
        return UnexpectedException(error.message);
      default:
        return ServerException(errorMsg);
    }
  }

  String _getErrorMessage(DioException error) {
    if (error.response?.data != null) {
      try {
        final data = jsonDecode(error.response!.data.toString());

        if (data['errors'] is Map) {
          final errors = data['errors'] as Map;
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
        }

        if (data['errorMessage'] != null) {
          return data['errorMessage'].toString();
        }

        if (data['message'] != null) {
          return data['message'].toString();
        }

        return 'An error occurred';
      } catch (_) {
        return 'Unexpected error';
      }
    }
    return error.message ?? 'Unknown error occurred';
  }
}

class MessageHandler {
  static void show({required String message, bool error = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,

      backgroundColor: error ? AppColors.errorColor : AppColors.successColor,
    );
  }
}
