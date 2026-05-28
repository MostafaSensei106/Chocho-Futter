// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogoutResponseBody _$LogoutResponseBodyFromJson(Map<String, dynamic> json) =>
    _LogoutResponseBody(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$LogoutResponseBodyToJson(_LogoutResponseBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
