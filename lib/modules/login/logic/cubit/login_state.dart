import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial(LoginFormState formState) = _Initial;
  const factory LoginState.loading(LoginFormState formState) = Loading;
  const factory LoginState.success(
    LoginFormState formState, {
    required T data,
  }) = Success<T>;
  const factory LoginState.failure(
    LoginFormState formState, {
    required String error,
  }) = Failure;
}

@freezed
sealed class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String username,
    @Default('') String deviceId,
    @Default(false) bool isValid,
    @Default(false) bool rememberMe,
  }) = _LoginFormState;
}

extension LoginStateX<T> on LoginState<T> {
  LoginFormState get formState => when(
    initial: (f) => f,
    loading: (f) => f,
    success: (f, _) => f,
    failure: (f, _) => f,
  );
}
