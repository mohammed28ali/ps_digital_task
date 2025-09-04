import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return message.toString();
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message])
    : super(message ?? "Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(message ?? "Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(message ?? "Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message])
    : super(message ?? "Requested Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(message ?? "Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
    : super(message ?? "Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
    : super(message ?? "No Internet Connection");
}

class BadCertificateException extends ServerException {
  const BadCertificateException([message])
    : super(message ?? "Bad SSL Certificate");
}

class RequestCancelledException extends ServerException {
  const RequestCancelledException([message])
    : super(message ?? "Request was cancelled");
}

class UnexpectedException extends ServerException {
  const UnexpectedException([message])
    : super(message ?? "Unexpected error occurred");
}

class JsonDecodingException extends ServerException {
  const JsonDecodingException([message])
    : super(message ?? "Unexpected error occurred");
}

class ForbiddenException extends ServerException {
  const ForbiddenException([message]) : super(message ?? "Forbidden");
}

class ConnectionTimeoutException extends ServerException {
  const ConnectionTimeoutException([message])
    : super(message ?? 'Connection timeout');
}

class SendTimeoutException extends ServerException {
  const SendTimeoutException([message]) : super(message ?? 'Send timeout');
}

class ReceiveTimeoutException extends ServerException {
  const ReceiveTimeoutException([message])
    : super(message ?? 'Receive timeout');
}

class UnprocessableEntityException extends ServerException {
  const UnprocessableEntityException([message])
    : super(message ?? 'Unprocessable entity');
}

class CacheException implements Exception {}
