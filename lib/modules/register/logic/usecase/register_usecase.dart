import '../../../../core/error/failures.dart';
import '../../../../core/utils/result/result.dart';
import '../../../../core/utils/use_case/base_usecase.dart';
import '../../data/models/register_request_body.dart';
import '../../data/models/register_response_body.dart';
import '../../data/repository/register_repository.dart';

final class RegisterUsecase
    implements BaseUsecase<RegisterResponseBody, RegisterRequestBody> {
  RegisterUsecase({required this._repo});

  final RegisterRepository _repo;

  @override
  Future<Result<RegisterResponseBody, Failures>> call(
    RegisterRequestBody params,
  ) => _repo.register(params);
}
