import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_response_body.freezed.dart';
part 'logout_response_body.g.dart';

@freezed
abstract class LogoutResponseBody with _$LogoutResponseBody {
  const factory LogoutResponseBody({
    required bool success,
    required String message,
    String? data,
  }) = _LogoutResponseBody;

  factory LogoutResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseBodyFromJson(json);
}
