import 'package:temp/core/error/failures.dart';
import 'package:temp/core/utils/result/result.dart';

typedef ApiResult<T> = Result<T, Failures>;

typedef LocalStorageResult<T> = Result<T, LocalStorageFailure>;
