import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/login/data/models/login_request_body.dart';
import 'package:shoppe/features/login/data/repo/login_repo.dart';
import 'package:shoppe/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLogin(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.whenOrNull(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
    );
  }
}
