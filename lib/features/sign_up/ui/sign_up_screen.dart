import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_have_account.dart';
import 'package:shoppe/core/widgets/app_terms_and_conditions.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:shoppe/features/sign_up/ui/widgets/create_account_text.dart';
import 'package:shoppe/features/sign_up/ui/widgets/signup_form.dart';
import 'package:shoppe/features/sign_up/ui/widgets/signup_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});



@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            right: 25.w,
            left: 25.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CreateAccountText(),
                verticalSpace(36),
                const SignUpForm(),
                AppTextButton(
                  onPressed: () {
                    validationThenSignUp(context);
                  },
                  text: 'Login',
                  textStyle: TextStyles.font22WhiteBold,
                ),
                verticalSpace(35),
                const AppTermsAndConditions(),
                verticalSpace(24),
                AppHaveAccount(
                    onPressed: () {
                      // context.navigatorPushNamedAndRemoveUntil(
                      //   Routes.loginScreen,
                      // );

                    context.pushNamed(Routes.loginScreen);



                    },
                    text: 'You have an account?',
                    textButton: 'Login'),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validationThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUp();
    }
  }
}
