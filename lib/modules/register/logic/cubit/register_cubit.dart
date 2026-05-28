import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/pref_keys.dart';
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
  }) : super(const RegisterState.initial(RegisterFormState()));

  final RegisterUsecase _registerUsecase;
  final BasePrefStorageService _prefStorageService;

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
}
