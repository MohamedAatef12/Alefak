import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure(
    this.message,
  );
}

class DioFailure extends Failure {
  DioFailure(super.message);

  factory DioFailure.fromDioError(dynamic error) {
    // error is usually DioError
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return DioFailure('Request was cancelled');
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return DioFailure('Connection timeout');
        case DioExceptionType.badResponse:
          // You can check error.response.statusCode to customize message
          final statusCode = error.response?.statusCode ?? 0;
          return DioFailure('Received invalid status code: $statusCode');
        case DioExceptionType.badCertificate:
          return DioFailure('Bad certificate');
        case DioExceptionType.connectionError:
          return DioFailure('Connection error');
        case DioExceptionType.unknown:
          return DioFailure(error.message ?? 'Unexpected error occurred');
      }
    } else {
      return DioFailure('Unexpected error occurred');
    }
  }
}
