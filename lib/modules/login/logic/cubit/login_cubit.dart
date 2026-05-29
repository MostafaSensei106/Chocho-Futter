import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/device/interface/base_device_id_service.dart';
import '../usecase/lgoin_usecase.dart';
import '../usecase/login_with_apple_usecase.dart';
import '../usecase/login_with_google_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._deviceIdService,
    this._loginWithGoogleUsecase,
    this._loginWithAppleUsecase,
    this._loginUsecase,
  ) : super(const LoginState.initial(LoginFormState())) {
    unawaited(_init());
  }

  final BaseDeviceIdService _deviceIdService;
  final LoginWithGoogleUsecase _loginWithGoogleUsecase;
  final LoginWithAppleUsecase _loginWithAppleUsecase;
  final LgoinUsecase _loginUsecase;

  Future<void> _init() async {
    final deviceId = await _deviceIdService.getDeviceId();
    emit(LoginState.initial(state.formState.copyWith(deviceId: deviceId)));
  }

  void onUsernameChanged(String value) {
    final form = state.formState;
    final isValid = value.trim().isNotEmpty && form.deviceId.trim().isNotEmpty;
    emit(LoginState.initial(form.copyWith(username: value, isValid: isValid)));
  }

  Future<void> login() async {
    if (!state.formState.isValid) return;
    emit(LoginState.loading(state.formState));

    await Future<void>.delayed(const Duration(seconds: 1));
    emit(
      LoginState.failure(
        state.formState,
        error: 'Login not fully implemented yet',
      ),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginState.loading(state.formState));

    await Future<void>.delayed(const Duration(seconds: 1));
    emit(
      LoginState.failure(
        state.formState,
        error: 'Google login not fully implemented yet',
      ),
    );
  }

  Future<void> loginWithApple() async {
    emit(LoginState.loading(state.formState));

    await Future<void>.delayed(const Duration(seconds: 1));
    emit(
      LoginState.failure(
        state.formState,
        error: 'Apple login not fully implemented yet',
      ),
    );
  }

  void onRememberMeChanged(bool value) {
    final form = state.formState;
    emit(LoginState.initial(form.copyWith(rememberMe: value)));
  }
}
