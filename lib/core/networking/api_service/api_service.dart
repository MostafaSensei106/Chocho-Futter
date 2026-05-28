import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../modules/register/data/models/register_request_body.dart';
import '../../../modules/register/data/models/register_response_body.dart';
import '../../constants/api_routes.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiRoutes.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiRoutes.register)
  Future<RegisterResponseBody> register(@Body() RegisterRequestBody body);
}
