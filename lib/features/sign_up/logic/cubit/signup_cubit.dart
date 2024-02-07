import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpCubit() : super((const SignUpState.initial()));
}
