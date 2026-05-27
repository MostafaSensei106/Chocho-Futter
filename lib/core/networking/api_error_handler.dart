import 'package:dio/dio.dart';
import '../constants/http_messages.dart';
import '../error/failures.dart';
import 'api_error_model/api_error_model.dart';

final class APIErrorHandler extends ServerFailure implements Exception {
  // Clean initialization using a private factory/expression rather than assigning late vars in constructor body
  APIErrorHandler.handle(dynamic error)
    : apiErrorModel = _determineErrorModel(error),
      super('');
  final ApiErrorModel apiErrorModel;

  @override
  String get message {
    // Safely extract the first validation error if present, otherwise fallback to the main message
    return apiErrorModel.errors?.values.firstOrNull?.firstOrNull ??
        apiErrorModel.message;
  }

  ApiErrorModel get failure => apiErrorModel;

  static ApiErrorModel _determineErrorModel(dynamic error) {
    if (error is! DioException) {
      return const ApiErrorModel(
        success: false,
        message: HttpMessages.unknownError,
        errors: {},
      );
    }

    return _handleDioException(error);
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return const ApiErrorModel(
          success: false,
          message:
              'No internet connection.\n'
              'Please check your network and try again.',
          errors: {},
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiErrorModel(
          success: false,
          message: HttpMessages.gatewayTimeout,
          errors: {},
        );

      case DioExceptionType.sendTimeout:
        return const ApiErrorModel(
          success: false,
          message: 'Network send timeout. Please try again.',
          errors: {},
        );

      case DioExceptionType.cancel:
        return const ApiErrorModel(
          success: false,
          message: 'Request was cancelled.',
          errors: {},
        );

      case DioExceptionType.badResponse:
        if (error.response?.data is Map<String, dynamic>) {
          return ApiErrorModel.fromJson(
            error.response!.data as Map<String, dynamic>,
          );
        }
        return const ApiErrorModel(
          success: false,
          message: HttpMessages.badRequest,
          errors: {},
        );

      case DioExceptionType.unknown:
        if (error.error != null &&
            error.error.toString().contains('SocketException')) {
          return const ApiErrorModel(
            success: false,
            message:
                'Server unreachable. Please verify your internet connection.',
            errors: {},
          );
        }
        return const ApiErrorModel(
          success: false,
          message: HttpMessages.unknownError,
          errors: {},
        );

      default:
        return const ApiErrorModel(
          success: false,
          message: HttpMessages.internalServerError,
          errors: {},
        );
    }
  }
}
