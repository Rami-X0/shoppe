import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:shoppe/features/sign_up/ui/widgets/create_account_text.dart';
import 'package:shoppe/features/sign_up/ui/widgets/sign_up_have_account.dart';
import 'package:shoppe/features/sign_up/ui/widgets/sign_up_terms_and_condition.dart';
import 'package:shoppe/features/sign_up/ui/widgets/signup_form.dart';
import 'package:shoppe/features/sign_up/ui/widgets/signup_bloc_listener.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                  shadowColor: ColorsManager.mainBlue,
                  onPressed: () {
                    validationThenSignUp(context);
                  },
                  text: AppLocalizations.of(context)!.create_account,
                  textStyle: TextStyles.font22WhiteBold,
                ),
                verticalSpace(35),
                const SignUpTermsAndConditions(),
                verticalSpace(24),
                const SignUpAccount(),
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
