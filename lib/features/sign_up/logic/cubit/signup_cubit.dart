import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/sign_up/data/models/signup_request.dart';
import 'package:shoppe/features/sign_up/data/repo/signup_repo.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpCubit(this._signUpRepo) : super((const SignUpState.initial()));

  void emitSignUp() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(SignUpRequest(
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      password: passwordController.text,
    ));
    response.whenOrNull(success: (signUpRequest) {
      emit(SignUpState.success(signUpRequest));
    });
  }
}
