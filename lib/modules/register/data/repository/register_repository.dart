import 'package:injectable/injectable.dart';

import '../../../../core/constants/types/type_def.dart';
import '../../../../core/networking/api_executor/api_executor.dart';
import '../../../../core/networking/api_service/api_service.dart';
import '../models/register_request_body.dart';
import '../models/register_response_body.dart';

abstract interface class RegisterRepository {
  Future<ApiResult<RegisterResponseBody>> register(RegisterRequestBody body);
}

@LazySingleton(as: RegisterRepository)
final class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({required this._api});

  final ApiService _api;

  @override
  Future<ApiResult<RegisterResponseBody>> register(RegisterRequestBody body) =>
      ApiExecutor.execute(action: () => _api.register(body));
}
