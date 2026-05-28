import 'package:json_annotation/json_annotation.dart';
import '../../../../core/networking/api_model/api_model/api_model.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  RegisterRequestBody({required this.deviceID, required this.username});

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

  @JsonKey(name: 'device_id')
  final String deviceID;
  @JsonKey(name: 'username')
  final String username;
}
