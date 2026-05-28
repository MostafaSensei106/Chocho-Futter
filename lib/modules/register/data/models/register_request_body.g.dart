// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      data: RegisterRequestData.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

RegisterRequestData _$RegisterRequestDataFromJson(Map<String, dynamic> json) =>
    RegisterRequestData(
      deviceID: json['device_id'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$RegisterRequestDataToJson(
  RegisterRequestData instance,
) => <String, dynamic>{
  'device_id': instance.deviceID,
  'username': instance.username,
};
