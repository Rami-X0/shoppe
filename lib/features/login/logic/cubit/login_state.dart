import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/login/data/models/login_response.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _initial;

  const factory LoginState.loading() = Loading;

  const factory LoginState.success(LoginResponse data) = Success<T>;
// const factory LoginState.failure(NetworkExceptions failure)=Failure<T>;
}
