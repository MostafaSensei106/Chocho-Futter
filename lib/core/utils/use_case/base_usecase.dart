import '../../error/failures.dart';
import '../result/result.dart';

abstract interface class BaseUsecase<T, Params> {
  Future<Result<T, Failures>> call(Params params);
}

final class NoParams {
  const NoParams();
}
