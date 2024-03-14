import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/login/ui/widgets/login_form.dart';
import 'package:shoppe/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:shoppe/core/widgets/app_terms_and_conditions.dart';
import 'package:shoppe/features/login/ui/widgets/login_have_account.dart';
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
                const LoginForm(),
                AppTextButton(
                  shadowColor: ColorsManager.mainBlue,
                  onPressed: () {
                    validateThenLogin(context);
                  },
                  text: 'Login',
                  textStyle: TextStyles.font22WhiteBold,
                ),
                verticalSpace(50),
                const Center(child: AppTermsAndConditions()),
                verticalSpace(24),
                const LoginHaveAccount(),
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
      context.read<LoginCubit>().emitLogin();
    }
  }
}
