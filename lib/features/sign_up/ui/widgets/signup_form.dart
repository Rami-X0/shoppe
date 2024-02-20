import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/app_regex.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/core/widgets/app_password_validations.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool hasNumber = false;
  bool _showPassword = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasMineLength = false;
  bool hasSpecialCharacters = false;
  bool isEmailColorFailureIcon = false;
  bool isPasswordColorFailureIcon = false;
  bool isNameColorFailureIcon = false;
  bool isPhoneColorFailureIcon = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacters(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMineLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            suffixIcon:   FaIcon(
              FontAwesomeIcons.solidEnvelope,
              color: isEmailColorFailureIcon
                  ? Colors.red
                  : ColorsManager.mainBlue,
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValidate(value)) {
                setState(() {
                  isEmailColorFailureIcon = true;
                });
                return 'Please enter your email right';
              } else {
                setState(() {
                  isEmailColorFailureIcon = false;
                });
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: 'Name',
            suffixIcon:  FaIcon(
              FontAwesomeIcons.solidUser,
              color: isNameColorFailureIcon
                  ? Colors.red
                  : ColorsManager.mainBlue,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  isNameColorFailureIcon = true;
                });
                return 'Please enter your name right';
              } else if (value.length < 4) {
                return "Name must be more than four letters";
              } else {
                setState(() {
                  isNameColorFailureIcon = false;
                });
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
            hintText: 'Phone',
            suffixIcon:  FaIcon(
              FontAwesomeIcons.squarePhone,
              color: isPhoneColorFailureIcon
                  ? Colors.red
                  : ColorsManager.mainBlue,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  isPhoneColorFailureIcon = true;
                });
                return 'Please enter your phone right';
              } else if (value.length < 8) {
                return "Number must be more than eight letters";
              } else {
                setState(() {
                  isPhoneColorFailureIcon = false;
                });
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            obscureText: _showPassword,
            hintText: 'Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: FaIcon(
                _showPassword
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
                color: isPasswordColorFailureIcon
                    ? Colors.red
                    : ColorsManager.mainBlue,
              ),
            ),
            //obscureText: _showPassword,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                setState(() {
                  isPasswordColorFailureIcon = true;
                });
                return 'Please enter your password right';
              } else {
                setState(() {
                  isPasswordColorFailureIcon = false;
                });
              }
            },
          ),
          verticalSpace(25),
          AppPasswordValidations(
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMineLength: hasMineLength,
          ),
          verticalSpace(10),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

}
