import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/device/interface/base_device_id_service.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._deviceIdService)
    : super(const LoginState.initial(LoginFormState())) {
    unawaited(_init());
  }

  final BaseDeviceIdService _deviceIdService;

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
}
