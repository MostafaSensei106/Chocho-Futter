import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/pref_keys.dart';
import '../../../../core/services/device/interface/base_device_id_service.dart';
import '../../../../core/services/shared_prefs/base_pref_storage_service.dart';
import '../../../../core/utils/result/result.dart';
import '../../data/models/register_request_body.dart';
import '../../data/models/register_response_body.dart';
import '../usecase/register_usecase.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this._registerUsecase,
    required this._prefStorageService,
    required this._deviceIdService,
  }) : super(const RegisterState.initial(RegisterFormState())) {
    _init();
  }

  final RegisterUsecase _registerUsecase;
  final BasePrefStorageService _prefStorageService;
  final BaseDeviceIdService _deviceIdService;

  Future<void> _init() async {
    final deviceId = await _deviceIdService.getDeviceId();
    final isValid = state.formState.username.trim().isNotEmpty && deviceId.trim().isNotEmpty;
    emit(RegisterState.initial(state.formState.copyWith(deviceId: deviceId, isValid: isValid)));
  }

  Future<void> register() async {
    if (!state.formState.isValid) return;
    final form = state.formState;
    emit(RegisterState.loading(form));

    final body = RegisterRequestBody(
      deviceID: form.deviceId,
      username: form.username,
    );

    final response = await _registerUsecase.call(body);

    response.when(
      success: (t) async {
        await _saveUserData(t, form.rememberMe);
        emit(RegisterState.success(form, data: t));
      },
      failure: (e) => emit(RegisterState.failure(form, error: e.message)),
    );
  }

  Future<void> _saveUserData(RegisterResponseBody t, bool rememberMe) async {
    await Future.wait([
      _prefStorageService.setData<String>(
        key: PrefKeys.userToken,
        value: t.data.token,
      ),
      _prefStorageService.setData<bool>(
        key: PrefKeys.isRememberMe,
        value: rememberMe,
      ),
    ]);
  }

  void onRememberMeChanged(bool value) {
    final form = state.formState;
    emit(RegisterState.initial(form.copyWith(rememberMe: value)));
  }

  void onUsernameChanged(String value) {
    final form = state.formState;
    final isValid = value.trim().isNotEmpty && form.deviceId.trim().isNotEmpty;
    emit(RegisterState.initial(form.copyWith(username: value, isValid: isValid)));
  }
}
