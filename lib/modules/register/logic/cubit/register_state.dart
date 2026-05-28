import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
sealed class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial(RegisterFormState formState) = _Initial;
  const factory RegisterState.loading(RegisterFormState formState) = Loading;
  const factory RegisterState.success(
    RegisterFormState formState, {
    required T data,
  }) = Success<T>;
  const factory RegisterState.failure(
    RegisterFormState formState, {
    required String error,
  }) = Failure;
}

@freezed
sealed class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    @Default('') String deviceId,
    @Default('') String username,
    @Default(false) bool isValid,
    @Default(false) bool rememberMe,
  }) = _RegisterFormState;
}

extension RegisterStateX<T> on RegisterState<T> {
  RegisterFormState get formState => when(
    initial: (f) => f,
    loading: (f) => f,
    success: (f, _) => f,
    failure: (f, _) => f,
  );
}
