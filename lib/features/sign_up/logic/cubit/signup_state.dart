import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/sign_up/data/models/signup_response.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;

  const factory SignUpState.loading() = Loading;

  const factory SignUpState.success(SignUpResponse data) = Success;
}
