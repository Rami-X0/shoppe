import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_have_account.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/login/data/models/login_request_body.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/login/ui/widgets/email_and_password.dart';
import 'package:shoppe/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:shoppe/core/widgets/app_terms_and_conditions.dart';
import 'package:shoppe/features/login/ui/widgets/text_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 95.h,
              right: 25.w,
              left: 25.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextLogin(),
                verticalSpace(36),
                const EmailAndPassword(),
                AppTextButton(
                  onPressed: () {
                    validateThenLogin(context);
                  },
                  text: 'Login',
                  textStyle: TextStyles.font22WhiteBold,
                ),
                verticalSpace(50),
                const Center(child: AppTermsAndConditions()),
                verticalSpace(24),
                AppHaveAccount(
                    onPressed: () {
                      context.navigatorPushNamedAndRemoveUntil(Routes.signUpScreen);
                    },
                    text: 'You don\'t have an account?',
                    textButton: 'Sign Up'),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLogin(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
