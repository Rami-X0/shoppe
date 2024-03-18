import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/app_regex.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/core/widgets/app_password_validations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPassword = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMineLength = false;
  bool isEmailColorFailureIcon = false;
  bool isPasswordColorFailureIcon = false;
  TextEditingController passwordController = TextEditingController();

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
            hintText: AppLocalizations.of(context)!.email,
            suffixIcon: FaIcon(
              FontAwesomeIcons.solidEnvelope,
              color:
                  isEmailColorFailureIcon ? Colors.red : ColorsManager.mainBlue,
            ),
            validator: (value) {
              return validateEmail(value);
            },
          ),
          verticalSpace(16),
          AppTextFormField(

            controller: context.read<LoginCubit>().passwordController,
            hintText: AppLocalizations.of(context)!.password,
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
            obscureText: _showPassword,
            validator: (value) {
              return validatePassword(value);
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValidate(value)) {
      setState(() {
        isEmailColorFailureIcon = true;
      });
      return AppLocalizations.of(context)!.enter_email;
    } else {
      setState(() {
        isEmailColorFailureIcon = false;
      });
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
      setState(() {
        isPasswordColorFailureIcon = true;
      });
      return AppLocalizations.of(context)!.enter_password;
    } else {
      setState(() {
        isPasswordColorFailureIcon = false;
      });
    }
    return null;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
