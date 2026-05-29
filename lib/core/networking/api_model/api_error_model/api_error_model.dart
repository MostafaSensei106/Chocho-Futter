import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  const ApiErrorModel({required this.success, required this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  final bool success;
  final ErrorDetail errors;
}

@JsonSerializable()
final class ErrorDetail {
  ErrorDetail({required this.code, required this.message});

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
  final String code;
  final String message;
  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}
