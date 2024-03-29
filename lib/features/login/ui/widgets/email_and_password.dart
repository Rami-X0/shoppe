import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/app_regex.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/login/ui/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

late TextEditingController passwordController;
bool _showPassword = true;
bool hasLowerCase = false;
bool hasUpperCase = false;
bool hasSpecialCharacters = false;
bool hasNumber = false;
bool hasMineLength = false;
bool isEmailColorFailureIcon = false;
bool isPasswordColorFailureIcon = false;

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',

            suffixIcon: _paddingSuffixIcon(

              FaIcon(
                FontAwesomeIcons.solidEnvelope,
                color: isEmailColorFailureIcon
                    ? Colors.red
                    : ColorsManager.mainBlue,
              ),
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
            controller: context.read<LoginCubit>().passwordController,
            // obscureText: _showPassword,
            hintText: 'Password',
            suffixIcon: _paddingSuffixIcon(
              GestureDetector(
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
            ),
            obscureText: _showPassword,
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
          PasswordValidations(
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
void _emailValidator(String value){

}

  Widget _paddingSuffixIcon(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 19.h,
        horizontal: 20.w,
      ),
      child: child,
    );
  }
}
