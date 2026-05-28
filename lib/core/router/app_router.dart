import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../modules/home/ui/page/home_page.dart';

import '../../modules/login/logic/cubit/login_cubit.dart';
import '../../modules/login/ui/page/login_page.dart';
import '../../modules/register/logic/cubit/register_cubit.dart';
import '../../modules/register/ui/page/register_page.dart';
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
    initialLocation: register,
    debugLogDiagnostics: true,
    routes: [...$appRoutes],
  );
}

@TypedGoRoute<HomeRoute>(path: AppRouter.home)
class HomeRoute extends CupertinoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<LoginRoute>(path: AppRouter.login)
class LoginRoute extends CupertinoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginPage(),
      );
}

@TypedGoRoute<RegisterRoute>(path: AppRouter.register)
class RegisterRoute extends CupertinoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => getIt<RegisterCubit>(),
    child: const RegisterPage(),
  );
}
