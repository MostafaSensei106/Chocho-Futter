import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../di/di.dart';
import 'cupertion_route_data.dart';

part 'app_router.g.dart';

final class AppRouter {
  static const String root = '/';
  static const String onboarding = '/onboarding';

  // Auth
  static const String login = '/login';
  static const String register = '/register';

  static const String home = '/home';

  static const String profile = '/profile';
  static const String userProfile = '/userProfile';

  // Profile & User Actions
  static const String editProfile = '/editProfile';

  static const String notifications = '/notifications';

  // Settings & Info
  static const String settings = '/settings';
  static const String language = '/language';
  static const String faq = '/faq';
  static const String helpAndSupport = '/helpAndSupport';
  static const String aboutDevs = '/aboutDevs';

  // Legal
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsAndConditions = '/termsAndConditions';
  static const String about = '/about';

  static final router = GoRouter(
    initialLocation: _initialLocation,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );

  static late String _initialLocation;

  static void setInitialLocation(String value) {
    _initialLocation = value;
  }
}

@TypedGoRoute<HomeRoute>(path: AppRouter.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}

@TypedGoRoute<LoginRoute>(path: AppRouter.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}
