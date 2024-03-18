import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/login/data/models/login_response.dart';


part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _initial;

  const factory LoginState.loading() = Loading;

  const factory LoginState.success(LoginResponse loginResponse) = Success;
  const factory LoginState.successSaveToken(  String token) = SuccessSaveToken;

}
