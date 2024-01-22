import'package:freezed_annotation/freezed_annotation.dart';
part  'login_state.freezed.dart';

@freezed
 class LoginState<T> with _$LoginState<T>{
  const factory LoginState.initial()=_initial;
  const factory LoginState.loading()=loading;
  const factory LoginState.success(T data)=success;
  const factory LoginState.failure(String message)=failure;
}


