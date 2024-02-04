import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _initial;

  const factory LoginState.loading() = Loading;

  const factory LoginState.success(T data) = Success<T>;
// const factory LoginState.failure(NetworkExceptions failure)=Failure<T>;
}
