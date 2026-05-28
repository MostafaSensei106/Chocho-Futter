import 'package:json_annotation/json_annotation.dart';
import '../../../../core/networking/api_model/api_model/api_model.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody extends ApiModel<RegisterRequestData> {
  RegisterRequestBody({required super.data, required super.success});
}

@JsonSerializable()
class RegisterRequestData {
  const RegisterRequestData({required this.deviceID, required this.username});

  factory RegisterRequestData.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDataFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestDataToJson(this);

  @JsonKey(name: 'device_id')
  final String deviceID;
  @JsonKey(name: 'username')
  final String username;
}
