import 'package:dio/dio.dart';
import '../constants/http_messages.dart';
import '../error/failures.dart';
import 'api_model/api_error_model/api_error_model.dart';

final class APIErrorHandler extends ServerFailure implements Exception {
  // Clean initialization using a private factory/expression rather than assigning late vars in constructor body
  APIErrorHandler.handle(dynamic error)
    : apiErrorModel = _determineErrorModel(error),
      super('');
  final ApiErrorModel apiErrorModel;

  @override
  String get message {
    return apiErrorModel.errors.message;
  }

  ApiErrorModel get failure => apiErrorModel;

  static ApiErrorModel _determineErrorModel(dynamic error) {
    if (error is! DioException) {
      return ApiErrorModel(
        success: false,
        errors: ErrorDetail(
          code: 'unknown',
          message: HttpMessages.unknownError,
        ),
      );
    }

    return _handleDioException(error);
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return ApiErrorModel(
          success: false,

          errors: ErrorDetail(
            code: 'connection_error',
            message: 'No internet connection.',
          ),
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          success: false,
          errors: ErrorDetail(
            code: 'timeout',
            message: HttpMessages.gatewayTimeout,
          ),
        );

      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
          success: false,
          errors: ErrorDetail(
            code: 'send_timeout',
            message: 'Network send timeout.',
          ),
        );

      case DioExceptionType.cancel:
        return ApiErrorModel(
          success: false,
          errors: ErrorDetail(
            code: 'request_cancelled',
            message: 'Request was cancelled.',
          ),
        );

      case DioExceptionType.badResponse:
        if (error.response?.data is Map<String, dynamic>) {
          return ApiErrorModel.fromJson(
            error.response!.data as Map<String, dynamic>,
          );
        }
        return ApiErrorModel(
          success: false,
          errors: ErrorDetail(
            code: 'bad_response',
            message: HttpMessages.badRequest,
          ),
        );

      case DioExceptionType.unknown:
        if (error.error != null &&
            error.error.toString().contains('SocketException')) {
          return ApiErrorModel(
            success: false,
            errors: ErrorDetail(
              code: 'socket_exception',
              message:
                  'Server unreachable. Please verify your internet connection.',
            ),
          );
        }
        return ApiErrorModel(
          success: false,
          errors: ErrorDetail(
            code: 'unknown',
            message: HttpMessages.unknownError,
          ),
        );

      default:
        return ApiErrorModel(
          success: false,
          errors: ErrorDetail(
            code: 'server_error',
            message: HttpMessages.internalServerError,
          ),
        );
    }
  }
}
