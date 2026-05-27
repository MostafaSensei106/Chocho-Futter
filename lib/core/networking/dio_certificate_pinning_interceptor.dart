import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

final class DioCertificatePinningInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    CertificatePinningInterceptor(
      allowedSHAFingerprints: ['mPD8kqJumUlVLREAQ3wb1fCTgmFbvBRH/NBnoba+N1Y='],
    );
    handler.next(options);
  }
}
