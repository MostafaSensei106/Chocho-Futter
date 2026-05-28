final class ApiRoutes {
  ApiRoutes._();
  static const String apiBaseURL = 'https://192.168.1.12:8080/api/v1/';

  static const String healthCheck = 'health/';

  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String loginWithGoogle = 'auth/login/google';
  static const String loginWithApple = 'auth/login/apple';

  static const String userProfile = 'user/profile';

  static const String butterflyWebsoket = 'butterfly/websocket';
  static const String butterflyRelease = 'butterfly/release';
  static const String butterflyCache = 'butterfly/cache';
}
