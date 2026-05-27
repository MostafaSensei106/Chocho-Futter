import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants/api_routes.dart';
import '../../utils/models/logout_model/logout_response_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiRoutes.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
}
