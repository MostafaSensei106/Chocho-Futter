import 'package:dio/dio.dart';

import '../constants/api_header.dart';
import '../constants/pref_keys.dart';
import '../services/shared_prefs/base_pref_storage_service.dart';

final class DioTokenInterceptor extends Interceptor {
  DioTokenInterceptor(this._tokenProvider);

  final BasePrefStorageService _tokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenProvider.getData<String>(key: PrefKeys.userToken);
    if (token != null) {
      options.headers[ApiHeader.authorization] = 'Bearer $token';
    }
    handler.next(options);
  }
}
