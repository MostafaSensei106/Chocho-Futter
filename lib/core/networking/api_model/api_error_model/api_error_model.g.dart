// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      errors: ErrorDetail.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'errors': instance.errors,
    };

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) => ErrorDetail(
  code: json['code'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};
