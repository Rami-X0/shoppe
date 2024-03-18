import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/networking/dio_factory.dart';
import 'package:shoppe/features/login/data/models/login_request_body.dart';
import 'package:shoppe/features/login/data/repo/login_repo.dart';
import 'package:shoppe/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLogin() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.whenOrNull(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
        updateToken();
      },
    );
  }

  void updateToken() async {
    Future.delayed(const Duration(seconds: 1), () async {
      token = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.token);
      DioFactory.dio!.options.headers["Authorization"] = token.toString();
      emit(LoginState.successSaveToken(token.toString()));
    });
  }
}
